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
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        final cubit = ProfileCubit.get(context);
        final userEntity = cubit.userEntity;

        return Scaffold(
          appBar: const ProfileAppBar(),
          body: userEntity != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 17.0.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.7),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.6),
                            width: 1.2.sp,
                          ),
                          image: const DecorationImage(
                            image: AssetImage(ImageAssets.baby1),
                          ),
                        ),
                      ),
                      SizedBox(height: 1.0.h),
                      Text(
                        userEntity.babyName,
                        style: TextStyle(fontSize: 23.0.sp),
                      ),
                      SizedBox(height: 2.0.h),
                      HeightWeightRow(user: userEntity),
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
