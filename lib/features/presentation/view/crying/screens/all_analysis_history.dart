import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../components/appbar_back_button.dart';
import '../widgets/analysis_history_list.dart';

class AllAnalysisHistory extends StatelessWidget {
  const AllAnalysisHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackButton(),
        title: const Text(AppStrings.analysisHistory),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Last 1 hour',
              style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            const Expanded(
              child: AnalysisHistoryList(),
            ),
          ],
        ),
      ),
    );
  }
}
