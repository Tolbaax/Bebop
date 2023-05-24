import 'package:bebop/features/presentation/view/settings/widgets/baby_info_form.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../components/buttons/appbar_back_button.dart';
import '../../../components/profile_image/my_cached_net_image.dart';
import '../../profile/cubit/cubit.dart';

class BabyInformationScreen extends StatelessWidget {
  const BabyInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ProfileCubit.get(context).userEntity;
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(AppStrings.babyInformation),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 18.0.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyCachedNetImage(
                imageUrl: user!.profilePic,
                radius: 35.0.sp,
                haveButton: true,
              ),
              SizedBox(height: 4.0.h),
              BabyInfoForm(),
            ],
          ),
        ),
      ),
    );
  }
}
