import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../functions/app_dialogs.dart';
import '../utils/app_color.dart';

Future<File?> pickImageFromGallery(BuildContext context,
    {imageSource = ImageSource.gallery}) async {
  File? image;
  try {
    final pickedImage = await ImagePicker().pickImage(source: imageSource);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    AppDialogs.showToast(msg: e.toString());
  }
  return image;
}

Future<CroppedFile?> cropImage(String path, {String? title}) async {
  return ImageCropper().cropImage(
    sourcePath: path,
    aspectRatioPresets: Platform.isAndroid
        ? [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ]
        : [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
    aspectRatio: const CropAspectRatio(
      ratioX: 1.0,
      ratioY: 1.0,
    ),
    compressQuality: 100,
    maxWidth: 400,
    maxHeight: 400,
    compressFormat: ImageCompressFormat.jpg,
    cropStyle: CropStyle.rectangle,
    uiSettings: [
      AndroidUiSettings(
        toolbarColor: AppColors.primary,
        toolbarTitle: title == null ? "Profile Image" : title,
        statusBarColor: AppColors.primary,
        hideBottomControls: true,
        lockAspectRatio: true,
        initAspectRatio: CropAspectRatioPreset.square,
        toolbarWidgetColor: Colors.white,
      ),
    ],
  );
}

// Function to check internet connectivity
Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}

// Remove empty lines from a string
String removeEmptyLines(String text) {
  List<String> lines =
      text.trim().split('\n').where((line) => line.trim().isNotEmpty).toList();
  return lines.join('\n');
}
