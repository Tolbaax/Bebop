import 'dart:io';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/presentation/view/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/shared/common.dart';
import '../../../../domain/entities/user_entity.dart';

mixin ProfileMixin on Cubit<ProfileStates> {
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();

  final picker = ImagePicker();
  File? profileImageFile;
  UserEntity? userEntity;
  File? memoryImage;

  int genderGroupValue = 0;
  bool memoriesFetched = false;

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

  selectGenderSegment(groupValue) {
    genderGroupValue = groupValue;
    emit(SelectGenderSegmentState());
  }

  void clearMemoryControllers() {
    titleController.clear();
    descController.clear();
    memoryImage = null;
    emit(ClearMemoryContrllersState());
  }
}
