import 'package:bebop/features/presentation/components/app_dialogs/dialogs/health_dialog.dart';
import 'package:bebop/features/presentation/components/app_dialogs/dialogs/value_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/app_color.dart';
import 'dialogs/confirm_delete_memory_dialog.dart';
import 'dialogs/feeding_dialog.dart';
import 'dialogs/logout_dialog.dart';

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

  static void showHealthDialog({required context, VoidCallback? onPressed}) =>
      HealthDialog.show(context: context);

  static void showValueDialog({context, text1, text2}) =>
      ValueDialog.show(context, text1, text2);
}
