import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:bebop/features/presentation/view/home/screens/reminder_screen.dart';
import 'package:bebop/features/presentation/view/profile/screens/memory_screen.dart';
import 'package:bebop/features/presentation/view/register/cubit/register_cubit.dart';
import 'package:bebop/features/presentation/view/settings/screens/baby_information_screen.dart';
import 'package:bebop/features/presentation/view/voice_reco/screens/voice_reco_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_strings.dart';
import '../../features/data/models/tips_model.dart';
import '../../features/presentation/view/crying/screens/crying_translate_screen.dart';
import '../../features/presentation/view/crying/screens/translate_result_screen.dart';
import '../../features/presentation/view/ehr/screens/ehr_screen.dart';
import '../../features/presentation/view/ehr/screens/heart_rate_screen.dart';
import '../../features/presentation/view/ehr/screens/oxygen_screen.dart';
import '../../features/presentation/view/ehr/screens/temp_screen.dart';
import '../../features/presentation/view/forget_password/forget_password_screen.dart';
import '../../features/presentation/view/home/screens/tips_details_screen.dart';
import '../../features/presentation/view/layout/cubit/cubit.dart';
import '../../features/presentation/view/layout/screens/layout_screen.dart';
import '../../features/presentation/view/location/cubit/map_cubit.dart';
import '../../features/presentation/view/location/screens/get_location_screen.dart';
import '../../features/presentation/view/location/screens/map_screen.dart';
import '../../features/presentation/view/login/screens/login_screen.dart';
import '../../features/presentation/view/onboarding/screens/onBoardingScreen.dart';
import '../../features/presentation/view/profile/cubit/cubit.dart';
import '../../features/presentation/view/profile/screens/add_memory.dart';
import '../../features/presentation/view/register/screens/baby_register_screen.dart';
import '../../features/presentation/view/register/screens/register_screen.dart';
import '../../features/presentation/view/settings/screens/settings_screen.dart';
import '../../features/presentation/view/splash/splash_screen.dart';

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
  static const String tipsDetails = '/tipsDetails';
  static const String addMemory = '/addMemory';
  static const String memory = '/memory';
  static const String cryTranslate = '/cryTranslate';
  static const String translateResult = '/translateResult';
  static const String settings = '/settings';
  static const String getLocation = '/getLocation';
  static const String mapScreen = '/mapScreen';
  static const String ehrScreen = '/ehrScreen';
  static const String heartRate = '/hearRate';
  static const String temp = '/temp';
  static const String oxygen = '/oxygen';
  static const String babyInformation = '/babyInformation';
  static const String reminder = '/reminder';
  static const String voiceReco = '/voiceReco';
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
          child: RegisterScreen(screenHeight: 1.h),
        );

      case Routes.babyRegister:
        final RegisterCubit cubit = settings.arguments as RegisterCubit;
        return PageTransition(
          type: PageTransitionType.fade,
          child: BabyRegisterScreen(cubit: cubit),
        );

      case Routes.layout:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (context) => LayoutCubit(),
            child: const LayoutScreen(),
          ),
        );

      case Routes.tipsDetails:
        final TipsModel tipsModel = settings.arguments as TipsModel;
        return PageTransition(
          type: PageTransitionType.fade,
          child: TipsDetailsScreen(tipsModel: tipsModel),
        );

      case Routes.addMemory:
        final ProfileCubit profileCubit = settings.arguments as ProfileCubit;
        return PageTransition(
          type: PageTransitionType.fade,
          child: AddMemoryScreen(cubit: profileCubit),
        );

      case Routes.memory:
        final MemoryEntity memory = settings.arguments as MemoryEntity;
        return PageTransition(
          type: PageTransitionType.fade,
          child: MemoryScreen(memory: memory),
        );

      case Routes.cryTranslate:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const CryingTranslateScreen(),
        );

      case Routes.translateResult:
        return PageTransition(
          type: PageTransitionType.scale,
          alignment: Alignment.center,
          child: const TranslateResultScreen(),
        );

      case Routes.settings:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: BlocProvider(
            create: (_) => LayoutCubit(),
            child: const SettingsScreen(),
          ),
        );

      case Routes.babyInformation:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const BabyInformationScreen(),
        );

      case Routes.getLocation:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const GetLocationScreen(),
        );

      case Routes.mapScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (context) => MapCubit(),
            child: const MapScreen(),
          ),
        );

      case Routes.ehrScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const EHRScreen(),
        );

      case Routes.heartRate:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const HeartRateScreen(),
        );

      case Routes.temp:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const TemperatureScreen(),
        );

      case Routes.oxygen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const OxygenScreen(),
        );

      case Routes.reminder:
        final int initialTabIndex = settings.arguments as int;
        return PageTransition(
          type: PageTransitionType.fade,
          child: ReminderScreen(initialTabIndex: initialTabIndex),
        );

      case Routes.voiceReco:
        return PageTransition(
          type: PageTransitionType.fade,
          child: VoiceRecoScreen(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 150),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: Scaffold(
            body: Center(
              child: Text(
                AppStrings.noRouteFound,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        );
      },
    );
  }
}
