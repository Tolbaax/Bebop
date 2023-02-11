import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../data/models/tips_model.dart';

class CustomSliverAppBar extends StatelessWidget {
  final TipsModel tipsModel;

  const CustomSliverAppBar({Key? key, required this.tipsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.back,
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.primary,
      expandedHeight: 32.h,
      pinned: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsetsDirectional.symmetric(
          horizontal: 10.w,
          vertical: 10.sp,
        ),
        background: Hero(
          tag: tipsModel.title,
          child: Image(
            image: AssetImage(
              tipsModel.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          tipsModel.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: AppStrings.defaultFont,
            fontSize: 13.0.sp,
            shadows: [
              Shadow(
                color: AppColors.spaceCadet.withOpacity(0.5),
                offset: const Offset(0.0, 0.7),
                blurRadius: 1.5,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
