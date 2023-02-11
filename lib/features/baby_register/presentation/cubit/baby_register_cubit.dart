import 'package:bebop/features/baby_register/presentation/cubit/baby_register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_color.dart';

class BabyRegisterCubit extends Cubit<BabyRegisterStates> {
  BabyRegisterCubit() : super(BabyRegisterInitialState());

  static BabyRegisterCubit get(context) => BlocProvider.of(context);
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
