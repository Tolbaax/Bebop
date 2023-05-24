import 'package:bebop/core/functions/validation.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/presentation/components/buttons/custom_button.dart';
import 'package:bebop/features/presentation/view/profile/cubit/cubit.dart';
import 'package:bebop/features/presentation/view/register/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../components/custom_input_field.dart';
import '../../register/widgets/custom_sliding_segmented_control.dart';

class BabyInfoForm extends StatelessWidget {
  const BabyInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = ProfileCubit.get(context).userEntity;
    final authCubit = RegisterCubit.get(context);
    final formKey = GlobalKey<FormState>();
    authCubit.babyNameController.text = user!.babyName.toString();
    authCubit.babyHeightController.text = user.babyHeight.toString();
    authCubit.babyWeightController.text = user.babyWeight.toString();
    authCubit.dateController.text = user.birthDate.toString();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomInputField(
              controller: authCubit.babyNameController,
              labelText: 'Baby Name',
              validator: (value) => Validators.validateName(value),
            ),
            SizedBox(height: 6.0.h),
            GestureDetector(
              onTap: () => authCubit.selectDate(context),
              child: CustomInputField(
                controller: authCubit.dateController,
                labelText: 'BirthDate',
                enabled: false,
                validator: (value) => Validators.validateName(value),
              ),
            ),
            SizedBox(height: 6.0.h),
            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    controller: authCubit.babyHeightController,
                    labelText: 'Height',
                    keyboardType: TextInputType.number,
                    validator: (value) => Validators.validateName(value),
                  ),
                ),
                SizedBox(
                  width: 5.0.w,
                ),
                Expanded(
                  child: CustomInputField(
                    controller: authCubit.babyWeightController,
                    labelText: 'Weight',
                    keyboardType: TextInputType.number,
                    validator: (value) => Validators.validateName(value),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.0.h,
            ),
            CustomSlidingSegmentedButton(
              text1: AppStrings.boy,
              text2: AppStrings.girl,
              groupValue: authCubit.genderGroupValue,
              onValueChanged: (groupValue) {
              //  authCubit.selectGenderSegment(groupValue);
              },
            ),
            SizedBox(
              height: 16.0.h,
            ),
            CustomButton(
              onTap: () {},
              text: AppStrings.save,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
