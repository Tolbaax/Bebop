import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/shared/common.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/functions/navigation/navigation.dart';
import '../../../../../core/services/injection_container.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../data/datasources/auth/local/auth_local_data_sources.dart';
import '../../../../domain/usecases/user/get_current_uid_usecase.dart';
import '../../../components/app_dialogs/app_dialogs.dart';
import '../../../components/buttons/appbar_back_button.dart';
import '../../../components/buttons/custom_button.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';
import '../widgets/baby_height_page.dart';
import '../widgets/baby_info_page.dart';
import '../widgets/baby_weight_page.dart';

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
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) async {
        if (state is RegisterSuccessState) {
          await sl<AuthLocalDataSource>()
              .setUserLoggedIn(sl<GetCurrentUIDUseCase>().toString())
              .then(
            (value) async {
              print(sl<GetCurrentUIDUseCase>().toString());
              navigateAndRemove(context, Routes.layout);
              sl<RegisterCubit>().clearSignUpControllers();
            },
          );
        }
      },
      builder: (context, state) {
        final cubit = RegisterCubit.get(context);
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
                      dotColor: AppColors.black.withOpacity(0.25),
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
                    onTap: () async {
                      if (cubit.babyNameController.text.isNotEmpty &&
                          cubit.dateController.text.isNotEmpty) {
                        _pageController.animateToPage(
                          _pageController.page!.toInt() + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        if (cubit.babyNameController.text.isEmpty) {
                          AppDialogs.showToast(msg: 'Name can\'t be empty');
                        } else {
                          AppDialogs.showToast(msg: 'Please Select Birthday');
                        }
                      }

                      if (_currentIndex == 2) {
                        if (await checkInternetConnectivity()) {
                          await cubit.register();
                        } else {
                          AppDialogs.showToast(
                              msg: AppStrings.noInternetAccess);
                        }
                      }
                    },
                    text: _currentIndex == 2
                        ? AppStrings.getStarted
                        : AppStrings.continu,
                    condition: state is RegisterLoadingState,
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
