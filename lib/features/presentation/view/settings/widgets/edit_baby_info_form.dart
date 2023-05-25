import 'package:bebop/core/functions/validation.dart';
import 'package:bebop/core/shared/common.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/functions/app_dialogs.dart';
import '../../../../../core/params/baby_params.dart';
import '../../../components/buttons/custom_button.dart';
import 'slide_segmented_Button.dart';
import '../../../components/custom_input_field.dart';
import '../../profile/cubit/cubit.dart';
import '../../profile/cubit/states.dart';
import '../../register/cubit/register_cubit.dart';

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
    final authCubit = RegisterCubit.get(context);
    final formKey = GlobalKey<FormState>();
    authCubit.babyNameController.text = user!.babyName.toString();
    authCubit.babyHeightController.text = user.babyHeight.toString();
    authCubit.babyWeightController.text = user.babyWeight.toString();
    authCubit.dateController.text = user.birthDate.toString();

    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomInputField(
                  controller: authCubit.babyNameController,
                  labelText: AppStrings.babyName,
                  validator: (value) => Validators.validateName(value),
                ),
                SizedBox(height: 6.0.h),
                GestureDetector(
                  onTap: () => authCubit.selectDate(context),
                  child: CustomInputField(
                    controller: authCubit.dateController,
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
                        controller: authCubit.babyHeightController,
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
                        controller: authCubit.babyWeightController,
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
                SlideSegmentedButton(cubit: cubit),
                SizedBox(
                  height: 16.0.h,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      if (await checkInternetConnectivity()) {
                        await cubit.updateBabyInfo(
                          BabyParams(
                            babyName: authCubit.babyNameController.text.trim(),
                            birthDate: authCubit.dateController.text.trim(),
                            height: double.parse(
                                authCubit.babyHeightController.text.trim()),
                            weight: double.parse(
                                authCubit.babyWeightController.text.trim()),
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
