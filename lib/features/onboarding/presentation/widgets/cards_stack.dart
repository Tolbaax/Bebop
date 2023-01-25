import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';

class CardsStack extends StatelessWidget {
  final int pageNumber;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;

  const CardsStack({
    super.key,
    required this.pageNumber,
    required this.lightCardChild,
    required this.darkCardChild,
    required this.lightCardOffsetAnimation,
    required this.darkCardOffsetAnimation,
  });

  bool get isOddPageNumber => pageNumber % 2 == 1;

  @override
  Widget build(BuildContext context) {
    final darkCardWidth = context.width - 2 * 32.0;
    final darkCardHeight = context.height / 3;

    return Padding(
      padding: EdgeInsetsDirectional.only(top: isOddPageNumber ? 3.0.h : 6.0.h),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          SlideTransition(
            position: darkCardOffsetAnimation,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: AppColors.primary.withOpacity(0.4),
              child: Container(
                width: darkCardWidth,
                height: darkCardHeight,
                padding: EdgeInsets.only(
                  top: !isOddPageNumber ? 10.0.h : 0.0,
                  bottom: isOddPageNumber ? 10.0.h : 0.0,
                ),
                child: darkCardChild,
              ),
            ),
          ),
          Positioned(
            top: !isOddPageNumber ? -3.0.h : null,
            bottom: isOddPageNumber ? -3.0.h : null,
            child: SlideTransition(
              position: lightCardOffsetAnimation,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: AppColors.primary.withOpacity(0.8),
                child: Container(
                  width: darkCardWidth * 0.208.w,
                  height: darkCardHeight * 0.053.h,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(child: lightCardChild),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
