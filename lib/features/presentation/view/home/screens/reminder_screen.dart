import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/constants.dart';
import 'package:bebop/features/presentation/view/home/cubit/cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                            child: Center(child: Text('Health Reminder'))),
                        Container(
                            child: Center(child: Text('Feeding Reminder'))),
                        Container(
                            child: Center(child: Text('Leisure Reminder'))),
                        Container(
                            child: Center(child: Text('Others Reminder'))),
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
