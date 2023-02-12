import 'package:bebop/features/home/data/models/tips_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../widgets/custom_sliver_appbar.dart';

class TipsDetailsScreen extends StatelessWidget {
  final TipsModel tipsModel;

  const TipsDetailsScreen({Key? key, required this.tipsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(tipsModel: tipsModel),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.all(20.0.sp),
              child: Text(
                tipsModel.description,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0.sp,
                  color: AppColors.black.withOpacity(0.85),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
