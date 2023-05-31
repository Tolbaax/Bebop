import 'dart:io';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/shared/common.dart';
import '../../../../domain/entities/user_entity.dart';
import 'states.dart';

mixin ProfileMixin on Cubit<ProfileStates> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final babyNameController = TextEditingController();
  final babyHeightController = TextEditingController();
  final babyWeightController = TextEditingController();
  final dateController = TextEditingController();

  final picker = ImagePicker();
  File? profileImageFile;
  UserEntity? userEntity;
  File? memoryImage;

  int genderGroupValue = 0;

  void selectProfileImageFromGallery(BuildContext context) async {
    final pickedFile = await pickImageFromGallery(context);
    if (pickedFile != null) {
      cropImage(pickedFile.path).then((value) {
        if (value != null) {
          profileImageFile = File(value.path);
          emit(SelectProfileImageFromGalleryState());
        }
      });
    }
  }

  void selectMemoryImageFromGallery(BuildContext context) async {
    final pickedFile = await pickImageFromGallery(context);
    if (pickedFile != null) {
      cropImage(pickedFile.path, title: AppStrings.memoryImage).then((value) {
        if (value != null) {
          memoryImage = File(value.path);
          emit(MemoryImagePickedSuccess());
        }
      });
    }
  }

  void clearMemoryControllers() {
    titleController.clear();
    descController.clear();
    memoryImage = null;
    emit(ClearMemoryContrllersState());
  }

  void selectDate(BuildContext context) async {
    CustomDatePicker.selectDate(context, dateController).then((value) {
      if (value != null) {
        emit(SelectBabyInfoDateState());
      }
    });
  }
}
