import 'dart:io';

import 'package:bebop/features/presentation/view/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../../core/shared/common.dart';
import '../../../../domain/entities/user_entity.dart';
import '../memory_model.dart';

mixin ProfileMixin on Cubit<ProfileStates> {
  final btnController = RoundedLoadingButtonController();
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<MemoryModel> memory = [];
  final picker = ImagePicker();
  UserEntity? userEntity;
  File? memoryImage;
  File? profileImageFile;

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

  int genderGroupValue = 0;

  selectGenderSegment(groupValue) {
    genderGroupValue = groupValue;
    emit(SelectGenderSegmentState());
  }
}
