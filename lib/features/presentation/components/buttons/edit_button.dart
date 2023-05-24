import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/shared/common.dart';
import '../../../../core/utils/app_color.dart';

class EditButton extends StatelessWidget {
  const EditButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectProfileImageFromGallery(context),
      child: Container(
        height: 25.5.sp,
        width: 25.5.sp,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              offset: const Offset(1, 2),
              blurRadius: 1.5.sp,
            ),
          ],
        ),
        child: Icon(
          Icons.camera_alt_rounded,
          color: AppColors.white,
          size: 16.0.sp,
        ),
      ),
    );
  }
}

void selectProfileImageFromGallery(BuildContext context) async {
  File? image = await pickImageFromGallery(context);
  if (image != null) {
    cropImage(image.path).then((value) {
      if (value != null) {
        //UserCubit.get(context).updateProfilePic(value.path);
      }
    });
  }
}
