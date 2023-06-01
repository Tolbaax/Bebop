import 'package:bebop/core/functions/validation/validation.dart';
import 'package:bebop/core/shared/common.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/params/baby_params.dart';
import '../../../components/app_dialogs/app_dialogs.dart';
import '../../../components/buttons/custom_button.dart';
import '../../../components/custom_input_field.dart';
import '../../profile/cubit/cubit.dart';
import '../../profile/cubit/states.dart';
import 'slide_segmented_Button.dart';

class EditBabyInfoForm extends StatefulWidget {
  const EditBabyInfoForm({Key? key}) : super(key: key);

  @override
  State<EditBabyInfoForm> createState() => _EditBabyInfoFormState();
}

class _EditBabyInfoFormState extends State<EditBabyInfoForm> {
  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    var user = cubit.userEntity;
    final formKey = GlobalKey<FormState>();
    cubit.babyNameController.text = user!.babyName.toString();
    cubit.babyHeightController.text = user.babyHeight.toString();
    cubit.babyWeightController.text = user.babyWeight.toString();
    cubit.dateController.text = user.birthDate.toString();

    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomInputField(
                  controller: cubit.babyNameController,
                  labelText: AppStrings.babyName,
                  validator: (value) => Validators.validateName(value),
                ),
                SizedBox(height: 6.0.h),
                GestureDetector(
                  onTap: () => cubit.selectDate(context),
                  child: CustomInputField(
                    controller: cubit.dateController,
                    labelText: AppStrings.birthdate,
                    enabled: false,
                    validator: (value) => Validators.validateName(value),
                  ),
                ),
                SizedBox(height: 6.0.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        controller: cubit.babyHeightController,
                        labelText: AppStrings.height,
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            Validators.validateBabyHeight(value),
                      ),
                    ),
                    SizedBox(
                      width: 5.0.w,
                    ),
                    Expanded(
                      child: CustomInputField(
                        controller: cubit.babyWeightController,
                        labelText: AppStrings.weight,
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            Validators.validateBabyWeight(value),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.0.h,
                ),
                SlideSegmentedButton(),
                SizedBox(
                  height: 16.0.h,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      if (await checkInternetConnectivity()) {
                        await cubit.updateBabyInfo(
                          BabyParams(
                            babyName: cubit.babyNameController.text.trim(),
                            birthDate: cubit.dateController.text.trim(),
                            height: double.parse(
                                cubit.babyHeightController.text.trim()),
                            weight: double.parse(
                                cubit.babyWeightController.text.trim()),
                            gender: cubit.genderGroupValue == 0
                                ? AppStrings.boy
                                : AppStrings.girl,
                            profileUrl: cubit.profileImageFile != null
                                ? cubit.profileImageFile!.path
                                : '',
                          ),
                        );
                      } else {
                        AppDialogs.showToast(msg: AppStrings.noInternetAccess);
                      }
                    }
                  },
                  text: AppStrings.save,
                  condition: state is UpdateBabyInfoLoadingState,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
