import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/crying/presentation/widgets/analysis_history_list.dart';
import 'package:bebop/features/crying/presentation/widgets/custom_cry_row.dart';
import 'package:bebop/features/crying/presentation/widgets/custom_translate_container.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';

class CryingScreen extends StatelessWidget {
  const CryingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.cryAnalysis),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0.sp),
          child: Column(
            children: [
              const CustomTranslateContainer(),
              SizedBox(
                height: 3.0.h,
              ),
              const CustomCryRow(
                icon: Icons.check_circle_rounded,
                title: AppStrings.cryTip2,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              const CustomCryRow(
                icon: Icons.check_circle_rounded,
                title: AppStrings.cryTip1,
              ),
              SizedBox(
                height: 5.5.h,
              ),
              Row(
                children: [
                  const CustomCryRow(
                    icon: Icons.access_time,
                    title: AppStrings.analysisHistory,
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.viewMore,
                    style: TextStyle(
                      fontSize: 10.0.sp,
                      color: AppColors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.0.h,
              ),
              const AnalysisHistoryList(),
            ],
          ),
        ),
      ),
    );
  }
}
