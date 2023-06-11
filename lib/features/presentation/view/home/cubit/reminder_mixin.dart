import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/presentation/view/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/shared/common.dart';
import '../../../../../core/utils/date_picker.dart';

mixin ReminderMixin on Cubit<ReminderStates> {
  //Health
  final healthType = TextEditingController();

  void selectHealthType(context, value) {
    healthType.text = value;

    emit(SelectTypeState());
  }

  // Feeding
  final feedingStartDate = TextEditingController();
  final feedingStartTime = TextEditingController();
  final feedingFinishDate = TextEditingController();
  final feedingFinishTime = TextEditingController();
  final feedingType = TextEditingController();
  final contentsType = TextEditingController();
  final feedingAmount = TextEditingController();
  final feedingDetails = TextEditingController();
  int feedingAmountType = 1;

  void selectStartDate(BuildContext context) {
    CustomDatePicker.selectDate(context).then((value) {
      final parsedDate = DateTime.parse(value.toString());
      feedingStartDate.text = DateFormat.MMMMd().format(parsedDate);
      emit(SelectDateState());
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
      emit(SelectTimeState());
    }
  }

  void selectFinishDate(BuildContext context) async {
    CustomDatePicker.selectDate(context).then((value) {
      final parsedDate = DateTime.parse(value.toString());
      feedingFinishDate.text = DateFormat.MMMMd().format(parsedDate);
      emit(SelectDateState());
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
      emit(SelectTimeState());
    }
  }

  void selectFeedingType(context, value) {
    feedingType.text = value;
    if (feedingType.text == AppStrings.breast) {
      feedingAmount.clear();
      contentsType.clear();
      feedingAmountType = 1;
    }
    if (feedingType.text == AppStrings.solids) {
      feedingFinishDate.clear();
      feedingFinishTime.clear();
      feedingAmount.clear();
      contentsType.clear();
      feedingAmountType = 1;
    }

    emit(SelectTypeState());
  }

  void selectContentsType(context, value) {
    contentsType.text = value;
    emit(SelectTypeState());
  }

  void selectUnitValue(int value) {
    feedingAmountType = value;
    emit(SelectUnitValueState());
  }
}
