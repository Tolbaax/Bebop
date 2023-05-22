import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/functions/app_dialogs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecases/auth/signout_usecase.dart';
import '../../../../domain/usecases/user/get_current_user_usecase.dart';
import '../memory_model.dart';
import 'states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignOutUseCase _signOutUseCase;

  ProfileCubit(
    this._signOutUseCase,
    this._getCurrentUserUseCase,
  ) : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  final btnController = RoundedLoadingButtonController();
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<MemoryModel> memory = [];
  final picker = ImagePicker();
  File? memoryImage;

  UserEntity? userEntity;

  Future<void> getCurrentUser() async {
    emit(GetCurrentUserLoadingState());
    final result = await _getCurrentUserUseCase(NoParams());

    result.fold(
      (l) => emit(GetCurrentUserErrorState()),
      (r) {
        userEntity = r;
        emit(GetCurrentUserSuccessState());
      },
    );
  }

  Future getMemoryImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      memoryImage = File(pickedFile.path);

      emit(MemoryImagePickedSuccess());
    }
  }

  void addMemory() async {
    if (formKey.currentState!.validate()) {
      try {
        memory.add(
          MemoryModel(
            image: 'memoryImage',
            title: titleController.text,
            time: timeController.text,
            date: dateController.text,
            desc: descController.text,
          ),
        );
        btnController.success();
        emit(AddMemorySuccess());
      } catch (e) {
        emit(AddMemoryError());
      }
    } else {
      btnController.error();
      Future.delayed(const Duration(seconds: 1), () {
        btnController.reset();
      });
    }
  }

  Future<void> signOut() async {
    emit(SignOutLoadingState());
    final result = await _signOutUseCase(NoParams()).catchError((e) {
      if (e is FirebaseAuthException) {
        AppDialogs.showToast(msg: e.message.toString());
        return Left(ServerFailure(e.message.toString()));
      }
      return Left(ServerFailure(e.message.toString()));
    });
    result.fold(
      (l) => emit(SignOutErrorState()),
      (r) => emit(SignOutSuccessState()),
    );
  }
}
