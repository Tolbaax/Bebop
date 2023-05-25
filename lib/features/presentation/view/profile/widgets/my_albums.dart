import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/presentation/components/loader.dart';
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
        final cubit = ProfileCubit.get(context);
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
              BlocBuilder<ProfileCubit, ProfileStates>(
                builder: (context, state) {
                  if (state is GetMemoriesLoadingState) {
                    return Loader();
                  } else if (state is GetMemoriesSuccessState) {
                    final memories = state.memories;

                    return SizedBox(
                      height: 18.5.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        // Add 1 for the button
                        itemCount: memories.length + 1,
                        itemBuilder: (context, index) {
                          if (index == memories.length) {
                            // Display button as the last item
                            return AddMemoryButton(cubit: cubit);
                          } else {
                            return MemoryItem(memory: memories[index]);
                          }
                        },
                      ),
                    );
                  } else if (state is GetMemoriesErrorState) {
                    return Text('Error: ${state.errorMessage}');
                  }

                  return Container();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
