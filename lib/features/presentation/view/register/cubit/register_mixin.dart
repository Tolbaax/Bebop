import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_color.dart';
import 'register_states.dart';

mixin RegisterMixin on Cubit<RegisterStates> {
  final nameController = TextEditingController();
  final babyNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dateController = TextEditingController();

  IconData suffix1 = Icons.visibility_off_outlined;
  IconData suffix2 = Icons.visibility_off_outlined;

  final PageController pageController = PageController();

  late int relationshipGroupValue = 0;
  late int genderGroupValue = 0;
  double babyHeight = 40.0;
  double babyWeight = 10.0;
  bool isPassword1 = true;
  bool isPassword2 = true;

  changeVisibility1() {
    isPassword1 = !isPassword1;
    suffix1 =
        isPassword1 ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityState1());
  }

  changeVisibility2() {
    isPassword2 = !isPassword2;
    suffix2 =
        isPassword2 ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityState2());
  }

  selectGenderSegment(groupValue) {
    genderGroupValue = groupValue;
    emit(SelectGenderSegmentState());
  }

  selectRelationshipSegment(groupValue) {
    relationshipGroupValue = groupValue;
    emit(SelectRelationshipSegmentState());
  }

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

  void setBabyHeight(dynamic value) {
    babyHeight = value;
    emit(SelectBabyHeight());
  }

  void setBabyWeight(value) {
    babyWeight = value;
    emit(SelectBabyWeight());
  }

  void clearSignUpControllers() {
    nameController.clear();
    babyNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    dateController.clear();
    emit(ClearSignUpControllersState());
  }
}
