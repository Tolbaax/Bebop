import 'dart:io';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/presentation/view/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../../core/shared/common.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../domain/entities/user_entity.dart';

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
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      dateController.text = DateFormat.yMMMd().format(pickedDate);
      emit(SelectBabyInfoDateState());
    }
  }
}
