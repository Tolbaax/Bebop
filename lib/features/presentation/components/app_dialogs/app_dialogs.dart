import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/app_color.dart';
import 'widgets/confirm_delete_memory.dart';
import 'widgets/feeding_dialog.dart';
import 'widgets/logout_dialog.dart';

class AppDialogs {
  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      backgroundColor: color ?? AppColors.primary,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }

  static void showLogOutDialog({required context, VoidCallback? onPressed}) =>
      LogoutDialog.show(context, onPressed);

  static void showConfirmDeleteMemory(context,
          {required VoidCallback? onPressed}) =>
      ConfirmDeleteMemoryDialog.show(context, onPressed);

  static void showFeedingDialog({required context}) =>
      FeedingDialog.show(context: context);
}
