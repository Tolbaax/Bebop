import 'package:bebop/core/extensions/extensions.dart';
import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/constants.dart';
import 'package:bebop/features/presentation/view/home/cubit/cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../components/buttons/appbar_back_button.dart';
import '../cubit/states.dart';

class ReminderScreen extends StatefulWidget {
  final int initialTabIndex;

  const ReminderScreen({Key? key, required this.initialTabIndex})
      : super(key: key);

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = Constants().reminderTabs;
  final indicatorColors = Constants().indicatorColors;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(AppStrings.reminder),
      ),
      body: BlocConsumer<ReminderCubit, ReminderStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
            length: tabs.length,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 2.5.w),
              child: Column(
                children: [
                  Container(
                    height: 5.0.h,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10.0.sp),
                    ),
                    child: AnimatedBuilder(
                      animation: _tabController.animation!,
                      builder: (context, child) {
                        return TabBar(
                          controller: _tabController,
                          dragStartBehavior: DragStartBehavior.down,
                          indicator: BoxDecoration(
                            color: indicatorColors[_tabController.index],
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          splashBorderRadius: BorderRadius.circular(15.0.sp),
                          tabs: tabs,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        // Add your respective reminder screens for each tab here
                        Container(
                          child: Center(
                            child: Text(
                              'No Data Yet\nAdd your baby\'s activity',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.5.sp,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsetsDirectional.symmetric(
                                  horizontal: 10.0.sp),
                              child: Column(
                                children: [
                                  SizedBox(height: 3.0.h),
                                  ReminderRow(
                                    text1: '1:15 Am,',
                                    text2: '15m, 20ml, bottle, formula',
                                  ),
                                  SizedBox(height: 2.0.h),
                                  ReminderRow(
                                    text1: '5:26 PM,',
                                    text2: '15m, Breast, formula',
                                  ),
                                  SizedBox(height: 2.0.h),
                                  ReminderRow(
                                    text1: '4:32 PM,',
                                    text2: '2m, Solids, baby reminder',
                                  ),
                                  SizedBox(height: 2.0.h),
                                  ReminderRow(
                                    text1: '8:45 Am,',
                                    text2: '17:30h, 50oz, bottle, formula',
                                  ),
                                  SizedBox(height: 2.0.h),
                                  ReminderRow(
                                    text1: '1:15 Am,',
                                    text2: '15m, bottle, formula',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: 3.0.h),
                                LeisureRow(
                                    text1: '7:05 AM, ',
                                    text2: '15m, outdoors, time to play'),
                                SizedBox(height: 2.0.h),
                                LeisureRow(
                                    text1: '10:35 AM, ',
                                    text2: '17m, tummy time'),
                                SizedBox(height: 2.0.h),
                                LeisureRow(
                                    text1: '05:35 PM, ',
                                    text2: '12h, bath time'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              'No Data Yet\nAdd your baby\'s activity',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.5.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: AppStrings.addReminder,
        onPressed: () =>
            Constants().navigateToReminderScreen(context, _tabController.index),
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class ReminderRow extends StatelessWidget {
  final String text1, text2;

  const ReminderRow({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: context.height * 0.05,
          width: context.height * 0.05,
          decoration: BoxDecoration(
            color: AppColors.teal.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              FontAwesomeIcons.bowlFood,
              color: AppColors.white,
              size: 15.5.sp,
            ),
          ),
        ),
        SizedBox(
          width: 8.sp,
        ),
        Text(
          text1,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.0.sp,
          ),
        ),
        SizedBox(
          width: 2.sp,
        ),
        Text(
          text2,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.0.sp,
          ),
        ),
      ],
    );
  }
}

class LeisureRow extends StatelessWidget {
  final String text1, text2;

  const LeisureRow({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: context.height * 0.05,
          width: context.height * 0.05,
          decoration: BoxDecoration(
            color: AppColors.darkBlue.withOpacity(0.7),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              FontAwesomeIcons.bath,
              color: AppColors.white,
              size: 15.5.sp,
            ),
          ),
        ),
        SizedBox(
          width: 8.sp,
        ),
        Text(
          text1,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.0.sp,
          ),
        ),
        SizedBox(
          width: 2.sp,
        ),
        Text(
          text2,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13.0.sp,
          ),
        ),
      ],
    );
  }
}
