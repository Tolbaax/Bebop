import 'package:bebop/core/functions/navigation.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../components/loader.dart';
import '../../../components/profile_image/my_cached_net_image.dart';
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
    UserEntity? user = ProfileCubit.get(context).userEntity;

    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is GetCurrentUserSuccessState) {
          user = ProfileCubit.get(context).userEntity;
        }

        if (state is DeleteMemorySuccessState) {
          ProfileCubit.get(context).getMemories();
          navigatePop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const ProfileAppBar(),
          body: user != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      MyCachedNetImage(
                        imageUrl: user!.profilePic,
                        radius: 35.0.sp,
                      ),
                      SizedBox(height: 1.0.h),
                      SizedBox(
                        width: context.width * 0.8,
                        child: Text(
                          user!.babyName,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.0.h),
                      HeightWeightRow(user: user!),
                      SizedBox(height: 2.0.h),
                      StackedLineChart(),
                      MyAlbums(),
                    ],
                  ),
                )
              : Loader(),
        );
      },
    );
  }
}
