import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app_color.dart';

class CustomDatePicker {
  static Future<DateTime?> selectDate(
      BuildContext context, TextEditingController dateController) async {
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
      return pickedDate;
    }
    return null;
  }
}
