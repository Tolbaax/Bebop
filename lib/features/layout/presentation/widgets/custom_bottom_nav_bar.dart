import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:bebop/features/layout/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/constants.dart';

class CustomBottomNavBar extends StatefulWidget {
  final LayoutCubit cubit;
  const CustomBottomNavBar({Key? key, required this.cubit}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation borderRadiusCurve;

  @override
  void initState() {
    super.initState();

    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    Future.delayed(
      const Duration(milliseconds: 500),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: Constants().iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive
            ? AppColors.primary
            : AppColors.spaceCadet.withOpacity(0.5);
        final fontWeight = isActive ? FontWeight.w600 : FontWeight.w400;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Constants().iconList[index],
              size: 16.0.sp,
              color: color,
            ),
            const SizedBox(height: 4),
            Text(
              Constants().titles[index],
              maxLines: 1,
              style: TextStyle(color: color, fontWeight: fontWeight),
            )
          ],
        );
      },
      backgroundColor: AppColors.white,
      activeIndex: widget.cubit.selectedIndex,
      splashColor: AppColors.primary,
      notchAndCornersAnimation: borderRadiusAnimation,
      splashSpeedInMilliseconds: 0,
      gapLocation: GapLocation.center,
      leftCornerRadius: 20.sp,
      splashRadius: 0.0,
      rightCornerRadius: 20.sp,
      onTap: (index) => widget.cubit.changeBottomNav(index),
      shadow: BoxShadow(
        offset: const Offset(0, 1),
        blurRadius: 0.5,
        spreadRadius: 0.4,
        color: AppColors.primary,
      ),
    );
  }
}
