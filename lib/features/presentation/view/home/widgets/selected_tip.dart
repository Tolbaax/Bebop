import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_color.dart';
import '../tips_model.dart';

class SelectedTip extends StatelessWidget {
  final TipsModel tipsModel;

  const SelectedTip({Key? key, required this.tipsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.tipsDetails, arguments: tipsModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15.sp),
          boxShadow: [
            BoxShadow(
              color: AppColors.spaceCadet.withOpacity(0.4),
              blurRadius: 1.0.sp,
              spreadRadius: 0.08,
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Hero(
                tag: tipsModel.title,
                child: Container(
                  height: 13.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0.sp),
                      topLeft: Radius.circular(15.0.sp),
                    ),
                    image: DecorationImage(
                      image: AssetImage(tipsModel.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 2.5.sp, end: 5.0.sp, start: 5.0.sp),
                child: Column(
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: Text(
                        tipsModel.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: Text(
                        tipsModel.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 9.0.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        tipsModel.time,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 8.0.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
