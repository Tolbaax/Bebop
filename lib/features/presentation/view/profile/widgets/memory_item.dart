import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/extensions/extensions.dart';
import 'package:bebop/core/functions/navigation.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';

class MemoryItem extends StatelessWidget {
  final MemoryEntity memory;

  const MemoryItem({Key? key, required this.memory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo(context, Routes.memory, arguments: memory),
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 2.5.w),
        child: Hero(
          tag: memory.memoryId,
          child: Container(
            height: 18.5.h,
            width: context.width * 0.32,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10.0.sp),
              image: DecorationImage(
                image: NetworkImage(memory.memoryImageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SizedBox(
                width: context.width * 0.28,
                child: Text(
                  memory.title,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      BoxShadow(
                        color: AppColors.spaceCadet.withOpacity(0.5.sp),
                        offset: const Offset(1, 1),
                        blurRadius: 4.0.sp,
                        spreadRadius: 5.0.sp,
                      )
                    ],
                    height: 0.3.h,
                    fontSize: 12.5.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
