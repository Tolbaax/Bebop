import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_color.dart';

class Constants {
  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      backgroundColor: color ?? AppColors.primary,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }

  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          msg,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }

  final iconList = <IconData>[
    FontAwesomeIcons.house,
    FontAwesomeIcons.faceSadCry,
    FontAwesomeIcons.chartSimple,
    FontAwesomeIcons.user,
  ];

  final titles = <String>[
    AppStrings.home,
    AppStrings.cry,
    AppStrings.track,
    AppStrings.profile,
  ];

  final List<String> images = [
    ImageAssets.baby1,
    ImageAssets.baby2,
    ImageAssets.baby3,
    ImageAssets.baby4,
  ];
  final List<String> imageTitle = [
    AppStrings.baby1,
    AppStrings.baby2,
    AppStrings.baby3,
    AppStrings.baby4,
  ];
}
