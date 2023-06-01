import 'package:flutter/material.dart';

class CustomDatePicker {
  static Future<DateTime?> selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      return pickedDate;
    }
    return null;
  }
}
