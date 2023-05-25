import 'package:bebop/core/functions/validation.dart';
import 'package:bebop/core/shared/common.dart';
import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/functions/app_dialogs.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../components/buttons/appbar_back_button.dart';
import '../../../components/buttons/custom_button.dart';
import '../../../components/custom_input_field.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class AddMemoryScreen extends StatelessWidget {
  final ProfileCubit cubit;

  const AddMemoryScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackButton(),
        title: const Text(AppStrings.addMemory),
      ),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is AddMemorySuccessState) {
            cubit.clearMemoryControllers();
            cubit.getMemories();
            AppDialogs.showToast(msg: AppStrings.addMemorySuccess);
            navigatePop(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 30.0.sp),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.0.h,
                      ),
                      GestureDetector(
                        onTap: () =>
                            cubit.selectMemoryImageFromGallery(context),
                        child: Container(
                          height: context.height * 0.3,
                          width: context.width * 0.75,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(12.0.sp),
                          ),
                          child: cubit.memoryImage != null
                              ? Container(
                                  height: context.height * 0.3,
                                  width: context.width * 0.75,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(12.0.sp),
                                    image: DecorationImage(
                                      image: FileImage(cubit.memoryImage!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Icon(
                                    FontAwesomeIcons.images,
                                    size: 45.0.sp,
                                    color:
                                        AppColors.spaceCadet.withOpacity(0.6),
                                  ),
                                ),
                        ),
                      ),
                      if (cubit.memoryImage != null)
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(AppColors.primary)),
                          onPressed: () =>
                              cubit.selectMemoryImageFromGallery(context),
                          child: Text(AppStrings.changeImage),
                        ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomInputField(
                        controller: cubit.titleController,
                        labelText: AppStrings.title,
                        textInputAction: TextInputAction.next,
                        validator: (value) =>
                            Validators.validateMemoryTitle(value),
                      ),
                      SizedBox(
                        height: 3.5.h,
                      ),
                      CustomInputField(
                        controller: cubit.descController,
                        labelText: AppStrings.desc,
                        keyboardType: TextInputType.multiline,
                        validator: (value) =>
                            Validators.validateMemoryDesc(value),
                      ),
                      SizedBox(
                        height: cubit.memoryImage == null ? 16.5.h : 13.0.h,
                      ),
                      CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            if (cubit.memoryImage == null) {
                              AppDialogs.showToast(
                                msg: AppStrings.pickImage,
                                color: AppColors.desire,
                              );
                            } else {
                              if (await checkInternetConnectivity()) {
                                await cubit.addMemory();
                              } else {
                                AppDialogs.showToast(
                                    msg: AppStrings.noInternetAccess);
                              }
                            }
                          }
                        },
                        text: AppStrings.addMemory,
                        condition: state is AddMemoryLoadingState,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
