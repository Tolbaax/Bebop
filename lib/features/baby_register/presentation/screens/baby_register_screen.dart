import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/core/widgets/appbar_back_button.dart';
import 'package:bebop/core/widgets/custom_button.dart';
import 'package:bebop/features/baby_register/presentation/cubit/baby_register_cubit.dart';
import 'package:bebop/features/baby_register/presentation/cubit/baby_register_states.dart';
import 'package:bebop/features/baby_register/presentation/widgets/baby_height_screen.dart';
import 'package:bebop/features/baby_register/presentation/widgets/baby_info_page.dart';
import 'package:bebop/features/baby_register/presentation/widgets/baby_weight_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_color.dart';

class BabyRegisterScreen extends StatefulWidget {
  const BabyRegisterScreen({Key? key}) : super(key: key);

  @override
  State<BabyRegisterScreen> createState() => _BabyRegisterScreenState();
}

class _BabyRegisterScreenState extends State<BabyRegisterScreen> {
  final _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BabyRegisterCubit, BabyRegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BabyRegisterCubit.get(context);
        Future<bool> onWillPop() async {
          if (_pageController.page != 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
            return false;
          }
          return true;
        }

        return WillPopScope(
          onWillPop: onWillPop,
          child: Scaffold(
            appBar: AppBar(
              leading: _currentIndex == 0
                  ? const AppBarBackButton()
                  : IconButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          _pageController.page!.toInt() - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        color: AppColors.primary,
                      ),
                    ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotWidth: 12.0.w,
                      dotHeight: 0.9.h,
                      activeDotColor: AppColors.primary,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.77,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {},
                      children: [
                        BabyInfoPage(cubit: cubit),
                        const BabyHeightPage(),
                        const BabyWeightPage(),
                      ],
                    ),
                  ),
                  CustomButton(
                    onTap: () {
                      _pageController.animateToPage(
                        _pageController.page!.toInt() + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    text: _currentIndex == 2
                        ? AppStrings.getStarted
                        : AppStrings.continu,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
