import 'package:bebop/features/presentation/view/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/shared/common.dart';
import '../../../../../core/utils/date_picker.dart';

mixin ReminderMixin on Cubit<ReminderStates> {
  String feedingStartDate = '';
  String feedingStartTime = '';
  String feedingFinishDate = '';
  String feedingFinishTime = '';

  void selectStartDate(BuildContext context) async {
    CustomDatePicker.selectDate(context).then((value) {
      final parsedDate = DateTime.parse(value.toString());
      feedingStartDate = DateFormat.MMMMd().format(parsedDate);
      emit(SelectFeedingStartDate());
    });
  }

  void selectStartTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final String formattedTime = formatTime(selectedTime);
      feedingStartTime = formattedTime;
      emit(SelectFeedingStartTime());
    }
  }

  void selectFinishDate(BuildContext context) async {
    CustomDatePicker.selectDate(context).then((value) {
      final parsedDate = DateTime.parse(value.toString());
      feedingFinishDate = DateFormat.MMMMd().format(parsedDate);
      emit(SelectFeedingStartDate());
    });
  }

  void selectFinishTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      final String formattedTime = formatTime(selectedTime);
      feedingFinishTime = formattedTime;
      emit(SelectFeedingStartTime());
    }
  }
}
