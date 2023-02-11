import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/baby_register/presentation/screens/baby_register_screen.dart';
import 'package:bebop/features/crying/presentation/screens/crying_screen.dart';
import 'package:bebop/features/forget_password/forget_password_screen.dart';
import 'package:bebop/features/home/data/models/tips_model.dart';
import 'package:bebop/features/home/presentation/screens/home_screen.dart';
import 'package:bebop/features/home/presentation/screens/tips_details_screen.dart';
import 'package:bebop/features/layout/presentation/cubit/cubit.dart';
import 'package:bebop/features/layout/presentation/screens/layout_screen.dart';
import 'package:bebop/features/login/presentation/screens/login_screen.dart';
import 'package:bebop/features/profile/presentation/screens/profile_screen.dart';
import 'package:bebop/features/register/presentation/cubit/register_cubit.dart';
import 'package:bebop/features/register/presentation/screens/register_screen.dart';
import 'package:bebop/features/splash/presentation/screens/splash_screen.dart';
import 'package:bebop/features/tracking/presentation/screens/tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_strings.dart';
import '../../features/baby_register/presentation/cubit/baby_register_cubit.dart';
import '../../features/onboarding/presentation/screens/onBoardingScreen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String register = '/register';
  static const String babyRegister = '/babyRegister';
  static const String babyInfo = '/babyInfo';
  static const String babyHeight = '/babyHeight';
  static const String babyWeight = '/babyWeight';
  static const String layout = '/layout';
  static const String home = '/home';
  static const String crying = '/crying';
  static const String tracking = '/tracking';
  static const String profile = '/profile';
  static const String tipsDetails = '/tipsDetails';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) {
          return OnBoardingScreen(screenHeight: context.height);
        });

      case Routes.login:
        return MaterialPageRoute(builder: (context) {
          return LoginScreen(screenHeight: context.height);
        });

      case Routes.forgetPassword:
        return PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          childCurrent: LoginScreen(screenHeight: 1.h),
          child: const ForgetPasswordScreen(),
        );

      case Routes.register:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (_) => RegisterCubit(),
            child: RegisterScreen(screenHeight: 1.h),
          ),
        );

      case Routes.babyRegister:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (_) => BabyRegisterCubit(),
            child: const BabyRegisterScreen(),
          ),
        );

      case Routes.layout:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (_) => LayoutCubit(),
            child: const LayoutScreen(),
          ),
        );

      case Routes.home:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const HomeScreen(),
        );

      case Routes.crying:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const CryingScreen(),
        );

      case Routes.tracking:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const TrackingScreen(),
        );

      case Routes.profile:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const ProfileScreen(),
        );

      case Routes.tipsDetails:
        final TipsModel tipsModel = settings.arguments as TipsModel;
        return PageTransition(
          type: PageTransitionType.fade,
          child: TipsDetailsScreen(tipsModel: tipsModel),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
