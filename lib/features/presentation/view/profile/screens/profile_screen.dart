import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../components/loader.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/custom_profile_appbar.dart';
import '../widgets/height_wight_row.dart';
import '../widgets/my_albums.dart';
import '../widgets/stacked_line_chart.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = ProfileCubit.get(context).userEntity;

    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is GetCurrentUserSuccessState) {
          user = ProfileCubit.get(context).userEntity;
          print(user);
        }
      },
      builder: (context, state) {
        final cubit = ProfileCubit.get(context);

        return Scaffold(
          appBar: const ProfileAppBar(),
          body: user != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 14.0.h,
                        width: 14.0.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.7),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.6),
                            width: 1.2.sp,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(ImageAssets.baby1),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.0.h),
                      Text(
                        user!.babyName,
                        style: TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 2.0.h),
                      HeightWeightRow(user: user!),
                      SizedBox(height: 2.0.h),
                      const StackedLineChart(),
                      MyAlbums(cubit: cubit),
                    ],
                  ),
                )
              : Loader(),
        );
      },
    );
  }
}
