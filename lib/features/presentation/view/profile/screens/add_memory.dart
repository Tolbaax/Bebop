import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/presentation/components/rounded_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../components/appbar_back_button.dart';
import '../../../components/custom_input_field.dart';
import '../cubit/cubit.dart';

class AddMemoryScreen extends StatelessWidget {
  final ProfileCubit cubit;

  const AddMemoryScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackButton(),
        title: const Text(AppStrings.addMemory),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 30.0.sp),
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 1.0.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.getMemoryImage();
                    },
                    child: Container(
                      height: context.height * 0.3,
                      width: context.width * 0.75,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.075),
                        borderRadius: BorderRadius.circular(12.0.sp),
                      ),
                      child: cubit.memoryImage != null
                          ? Image.file(
                              cubit.memoryImage!,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Icon(
                                FontAwesomeIcons.images,
                                size: 45.0.sp,
                                color: AppColors.spaceCadet.withOpacity(0.6),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomInputField(
                    labelText: 'Title',
                    controller: cubit.titleController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: context.width * 0.35,
                        child: CustomInputField(
                          labelText: 'Time',
                          controller: cubit.timeController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please select time';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.35,
                        child: CustomInputField(
                          labelText: 'Date',
                          controller: cubit.dateController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please select date';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  CustomInputField(
                    labelText: 'Description',
                    controller: cubit.descController,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.5.h,
                  ),
                  CustomRoundedLoadingButton(
                    onPressed: () {
                      cubit.addMemory();
                    },
                    text: AppStrings.addMemory,
                    btnController: cubit.btnController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
