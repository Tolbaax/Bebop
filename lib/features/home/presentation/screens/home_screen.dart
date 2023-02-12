import 'package:bebop/features/home/presentation/widgets/custom_carousel_slider.dart';
import 'package:bebop/features/home/presentation/widgets/tips_for_mom.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/toady_reminder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 7.h),
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomCarousalSlider(),
            SizedBox(
              height: 3.0.h,
            ),
            const ToadyReminder(),
            SizedBox(
              height: 4.0.h,
            ),
            const TipsForMom(),
          ],
        ),
      ),
    );
  }
}
