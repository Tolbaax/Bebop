import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/forget_password/forget_password_screen.dart';
import 'package:bebop/features/login/presentation/screens/login_screen.dart';
import 'package:bebop/features/register/presentation/screens/register_screen.dart';
import 'package:bebop/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_strings.dart';
import '../../features/onboarding/presentation/screens/onBoardingScreen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String signup = '/signup';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
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
          type: PageTransitionType.rightToLeft,
          child: const ForgetPasswordScreen(),
        );

      case Routes.signup:
        return PageTransition(
          type: PageTransitionType.fade,
          child: RegisterScreen(screenHeight: 1.h),
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
