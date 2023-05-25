import 'dart:io';

import 'package:bebop/core/params/baby_params.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
}
