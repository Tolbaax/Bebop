import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/presentation/view/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/shared/common.dart';
import '../../../../../core/utils/date_picker.dart';

mixin ReminderMixin on Cubit<ReminderStates> {
  final feedingStartDate = TextEditingController();
  final feedingStartTime = TextEditingController();
  final feedingFinishDate = TextEditingController();
  final feedingFinishTime = TextEditingController();
  final feedingType = TextEditingController();
  final contentsType = TextEditingController();
  final feedingAmount = TextEditingController();
  final feedingAmountType = TextEditingController();
  final feedingDetails = TextEditingController();

  void selectStartDate(BuildContext context) {
    CustomDatePicker.selectDate(context).then((value) {
      final parsedDate = DateTime.parse(value.toString());
      feedingStartDate.text = DateFormat.MMMMd().format(parsedDate);
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
      feedingStartTime.text = formattedTime;
      emit(SelectFeedingStartTime());
    }
  }

  void selectFinishDate(BuildContext context) async {
    CustomDatePicker.selectDate(context).then((value) {
      final parsedDate = DateTime.parse(value.toString());
      feedingFinishDate.text = DateFormat.MMMMd().format(parsedDate);
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
      feedingFinishTime.text = formattedTime;
      emit(SelectFeedingStartTime());
    }
  }

  void selectFeedingType(context, value) {
    feedingType.text = value;
    if (feedingType.text == AppStrings.breast) {
      feedingAmountType.clear();
      feedingAmount.clear();
      contentsType.clear();
    }
    if (feedingType.text == AppStrings.solids) {
      feedingFinishDate.clear();
      feedingFinishTime.clear();
      feedingAmountType.clear();
      feedingAmount.clear();
      contentsType.clear();
    }

    emit(SelectFeedingType());
  }

  void selectContentsType(context, value) {
    contentsType.text = value;
    emit(SelectFeedingType());
  }
}
