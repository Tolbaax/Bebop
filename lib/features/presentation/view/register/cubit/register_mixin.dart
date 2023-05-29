import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/date_picker.dart';
import 'register_states.dart';

mixin RegisterMixin on Cubit<RegisterStates> {
  final nameController = TextEditingController();
  final babyNameController = TextEditingController();
  final babyHeightController = TextEditingController();
  final babyWeightController = TextEditingController();
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
    CustomDatePicker.selectDate(context, dateController).then((value) {
      if (value != null) {
        emit(SelectBabyInfoDateState());
      }
    });
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
