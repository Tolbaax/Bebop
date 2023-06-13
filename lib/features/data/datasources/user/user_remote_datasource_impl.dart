import 'dart:io';

import 'package:bebop/core/params/baby_params.dart';
import 'package:bebop/core/params/memory_params.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/memory_model.dart';
import '../../models/user_model.dart';
import 'user_remote_datasource.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final FirebaseStorage firebaseStorage;

  UserRemoteDataSourceImpl({
    required this.auth,
    required this.firestore,
    required this.firebaseStorage,
  });

  @override
  Future<String> getCurrentUID() async => auth.currentUser!.uid;

  @override
  Future<UserModel> getCurrentUser() async {
    var userData =
        await firestore.collection('users').doc(await getCurrentUID()).get();
    UserModel user = UserModel.fromJson(userData.data()!);
    return user;
  }

  Future<String> _storeFileToFirebase(String path, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(path).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> _deleteFileFromFirebase(String path) async {
    return await firebaseStorage.refFromURL(path).delete();
  }

  Future<void> _updateProfilePic(String path) async {
    String uID = await getCurrentUID();

    //Firstly delete previous image
    var userData = await firestore.collection('users').doc(uID).get();
    UserModel user = UserModel.fromJson(userData.data()!);
    if (user.profilePic.isNotEmpty) {
      await _deleteFileFromFirebase(user.profilePic);
    }

    //Then upload new image
    String photoUrl = await _storeFileToFirebase(
      'profilePics/$uID',
      File(path),
    );

    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'profilePic': photoUrl,
    });
  }

  @override
  Future<void> updateBabyInfo(BabyParams params) async {
    if (params.profileUrl.isNotEmpty)
      await _updateProfilePic(params.profileUrl);

    await firestore.collection('users').doc(await getCurrentUID()).update({
      'babyName': params.babyName,
      'birthDate': params.birthDate,
      'babyHeight': params.height,
      'babyWeight': params.weight,
      'gender': params.gender,
    });
  }

  @override
  Future<void> addMemory(MemoryParams params) async {
    final user = await getCurrentUser();
    final uID = await getCurrentUID();

    final memoryDocRef =
        firestore.collection('users').doc(uID).collection('memories').doc();

    final memoryId = memoryDocRef.id;

    String username = user.email.substring(0, user.email.indexOf('@'));

    final String memoryPath = 'memories/$username/images/$memoryId';

    final imageUrl = await _uploadFileToFirebase(memoryPath, params.imageFile);

    final post = MemoryModel(
      memoryId: memoryId,
      title: params.title,
      desc: params.desc,
      memoryImageUrl: imageUrl,
      publishTime: DateTime.now().toString(),
    );

    await memoryDocRef.set(post.toJson());
  }

  Future<String> _uploadFileToFirebase(String path, File? file) async {
    if (file == null) return '';

    final uploadTask = firebaseStorage.ref().child(path).putFile(file);
    final snap = await uploadTask;
    final downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<List<MemoryEntity>> getMemories() async {
    final uID = await getCurrentUID();
    final memoriesCollection = firestore
        .collection('users')
        .doc(uID)
        .collection('memories')
        .orderBy('publishTime', descending: true);

    final snapshot = await memoriesCollection.get();

    final memories =
        snapshot.docs.map((doc) => MemoryModel.fromJson(doc.data())).toList();

    return memories;
  }

  Future<MemoryModel> _getMemoryById(String memoryId) async {
    final userDoc = firestore.collection('users').doc(await getCurrentUID());

    final memoryDoc = await userDoc.collection('memories').doc(memoryId).get();

    MemoryModel memory = MemoryModel.fromJson(memoryDoc.data()!);

    return memory;
  }

  @override
  Future<void> deleteMemory(String memoryId) async {
    final uID = await getCurrentUID();

    final userDoc = firestore.collection('users').doc(uID);

    final memoryDoc = await userDoc.collection('memories').doc(memoryId);

    final memory = await _getMemoryById(memoryId);

    await _deleteFileFromFirebase(memory.memoryImageUrl);

    await memoryDoc.delete();
  }
  
}
