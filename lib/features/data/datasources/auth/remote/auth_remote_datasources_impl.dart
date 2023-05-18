import 'package:bebop/core/params/signup_params.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/params/signin_params.dart';
import '../../../models/user_model.dart';
import 'auth_remote_datasources.dart';

class FirebaseRemoteAuthDataSourceImpl implements FirebaseRemoteAuthDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseRemoteAuthDataSourceImpl({
    required this.auth,
    required this.firestore,
  });

  @override
  Future<void> signIn(SignInParams params) async =>
      await auth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Future<void> signUp(SignUpParams params) async {
    final result = await auth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    final uID = result.user!.uid;

    UserModel user = UserModel(
      name: params.name,
      email: params.email,
      babyName: params.babyName,
      gender: params.gender,
      birthDate: params.birthDate,
      relationship: params.relationship,
      profilePic: '',
      babyHeight: params.babyHeight,
      babyWeight: params.babyWeight,
    );

    await firestore.collection('users').doc(uID).set(user.toJson());

    await auth.currentUser!.sendEmailVerification();
  }
}
