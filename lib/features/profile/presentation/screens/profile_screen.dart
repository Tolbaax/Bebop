import 'package:bebop/features/profile/presentation/cubit/cubit.dart';
import 'package:bebop/features/profile/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../widgets/custom_profile_appbar.dart';
import '../widgets/height_wight_row.dart';
import '../widgets/my_albums.dart';
import '../widgets/stacked_line_chart.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = ProfileCubit();
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(7.0.h),
              child: const CustomProfileAppBar(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 17.0.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.7),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.primary.withOpacity(0.6),
                          width: 1.2.sp),
                      image: const DecorationImage(
                        image: AssetImage(ImageAssets.baby1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text(
                    AppStrings.babyName,
                    style: TextStyle(fontSize: 23.0.sp),
                  ),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  const HeightWeightRow(),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  const StackedLineChart(),
                  MyAlbums(cubit: cubit),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
