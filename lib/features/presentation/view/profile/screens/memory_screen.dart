import 'package:bebop/core/functions/app_dialogs.dart';
import 'package:bebop/core/shared/common.dart';
import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:bebop/features/presentation/view/profile/cubit/cubit.dart';
import 'package:bebop/features/presentation/view/profile/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/functions/navigation.dart';
import '../../../components/buttons/appbar_back_button.dart';

class MemoryScreen extends StatelessWidget {
  final MemoryEntity memory;

  const MemoryScreen({Key? key, required this.memory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(memory.title),
      ),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          final condition = state is DeleteMemoryLoadingState;

          return Center(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 3.0.w),
              child: Column(
                children: [
                  Hero(
                    tag: memory.memoryId,
                    child: Container(
                      height: context.height * 0.43,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(10.0.sp),
                        image: DecorationImage(
                          image: NetworkImage(memory.memoryImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      DateFormat.yMMMd('en_US').format(
                        DateTime.parse(memory.publishTime),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsetsDirectional.all(5.0.sp),
                      color: AppColors.white,
                      child: ListView(
                        children: [
                          Text(
                            removeEmptyLines(memory.desc),
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.5,
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primary),
                      ),
                      onPressed: () => AppDialogs.showConfirmDeleteMemory(
                        context,
                        onPressed: () {
                          navigatePop(context);
                          ProfileCubit.get(context)
                              .deleteMemory(memory.memoryId);
                        },
                      ),
                      child: condition
                          ? CircularProgressIndicator(
                              color: AppColors.white, strokeWidth: 1.6)
                          : Text(
                              AppStrings.deleteMemory,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0.sp,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
