import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:bebop/features/presentation/components/loader.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'add_memory_button.dart';
import 'memory_item.dart';

class MyAlbums extends StatelessWidget {
  const MyAlbums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        final memories = ProfileCubit.get(context).memoriesList;
        return Padding(
          padding: EdgeInsetsDirectional.only(
              top: 1.0.h, start: 15.0.sp, bottom: 12.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.myAlbums,
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ConditionalBuilder(
                condition: state is! GetMemoriesLoadingState,
                builder: (context) => _buildMemoriesList(memories, context),
                fallback: (context) => Loader(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMemoriesList(List<MemoryEntity> memories, BuildContext context) {
    return SizedBox(
      height: 18.5.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: memories.length + 1,
        itemBuilder: (context, index) {
          if (index == memories.length) {
            return AddMemoryButton(cubit: ProfileCubit.get(context));
          } else {
            return MemoryItem(memory: memories[index]);
          }
        },
      ),
    );
  }
}
