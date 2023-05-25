import 'package:bebop/core/functions/navigation.dart';
import 'package:bebop/features/presentation/view/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../components/buttons/appbar_back_button.dart';
import '../../../components/profile_image/my_cached_net_image.dart';
import '../../profile/cubit/cubit.dart';
import '../widgets/edit_baby_info_form.dart';

class BabyInformationScreen extends StatelessWidget {
  const BabyInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.get(context);
    final user = cubit.userEntity;
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(AppStrings.babyInformation),
      ),
      body: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) async {
          if (state is UpdateBabyInfoSuccessState) {
            await cubit.getCurrentUser();
            navigatePop(context);
            cubit.profileImageFile = null;
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 18.0.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MyCachedNetImage(
                    onTap: () => cubit.selectProfileImageFromGallery(context),
                    imageUrl: user!.profilePic,
                    radius: 35.0.sp,
                    haveButton: true,
                    imageFile: cubit.profileImageFile,
                  ),
                  SizedBox(height: 4.0.h),
                  EditBabyInfoForm(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
