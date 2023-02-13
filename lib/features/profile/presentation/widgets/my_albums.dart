import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/profile/data/models/memory_model.dart';
import 'package:bebop/features/profile/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyAlbums extends StatelessWidget {
  final ProfileCubit cubit;

  const MyAlbums({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: 1.5.h, start: 17.0.sp, bottom: 13.2.h),
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
          SizedBox(
            height: 1.0.h,
          ),
          SizedBox(
            height: 18.5.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: albums.length + 1,
              itemBuilder: (context, index) {
                if (index == albums.length) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.addMemory,
                        arguments: cubit,
                      );
                    },
                    child: Container(
                      margin: EdgeInsetsDirectional.all(5.0.sp),
                      width: context.width * 0.3,
                      decoration: BoxDecoration(
                        color: AppColors.hint.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(12.0.sp),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 30.0.sp,
                        ),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: EdgeInsetsDirectional.only(end: 2.5.w),
                  child: Container(
                    height: 18.5.h,
                    width: context.width * 0.32,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10.0.sp),
                      image: DecorationImage(
                        image: AssetImage(albums[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: SizedBox(
                        width: context.width * 0.28,
                        child: Text(
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          albums[index].title,
                          style: TextStyle(
                            color: AppColors.white,
                            shadows: [
                              BoxShadow(
                                color: AppColors.spaceCadet.withOpacity(0.5),
                                offset: const Offset(1, 1),
                                blurRadius: 4.0,
                              )
                            ],
                            height: 0.3.h,
                            fontSize: 12.5.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
