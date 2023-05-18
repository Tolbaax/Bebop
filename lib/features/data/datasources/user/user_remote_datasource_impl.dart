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
}
