import 'package:bebop/features/register/presentation/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_color.dart';

mixin RegisterMixin on Cubit<RegisterStates> {

  //Change Visibility1
  bool isPassword1 = true;
  IconData suffix1 = Icons.visibility_off_outlined;

  changeVisibility1() {
    isPassword1 = !isPassword1;
    suffix1 =
    isPassword1 ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityState1());
  }

  //Change Visibility2
  bool isPassword2 = true;
  IconData suffix2 = Icons.visibility_off_outlined;

  changeVisibility2() {
    isPassword2 = !isPassword2;
    suffix2 =
    isPassword2 ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityState2());
  }

  late int genderGroupValue = 0;
  late int relationshipGroupValue = 0;
  dynamic babyHeight = 40.0;
  dynamic babyWeight = 10.0;
  final PageController pageController = PageController();

  selectGenderSegment(groupValue) {
    genderGroupValue = groupValue;
    emit(SelectGenderSegmentState());
  }

  selectRelationshipSegment(groupValue) {
    relationshipGroupValue = groupValue;
    emit(SelectRelationshipSegmentState());
  }

  //BABY REGISTER
  final dateController = TextEditingController();

  void selectDate(BuildContext context) async {
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
      emit(SelectDateState());
    }
  }

  void selectBabyHeight(dynamic value) {
    babyHeight = value;
    emit(SelectBabyHeight());
  }

  void selectBabyWeight(value) {
    babyHeight = value;
    emit(SelectBabyWeight());
  }
}
