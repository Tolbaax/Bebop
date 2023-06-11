import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../features/presentation/components/app_dialogs/app_dialogs.dart';
import 'app_color.dart';

class Constants {
  String todayDate = DateFormat('dd MMM yyyy').format(DateTime.now());

  final iconList = <IconData>[
    FontAwesomeIcons.house,
    FontAwesomeIcons.faceSadCry,
    FontAwesomeIcons.chartSimple,
    FontAwesomeIcons.user,
  ];

  final titles = <String>[
    AppStrings.home,
    AppStrings.cry,
    AppStrings.track,
    AppStrings.profile,
  ];

  final List<String> images = [
    ImageAssets.baby1,
    ImageAssets.baby2,
    ImageAssets.baby3,
    ImageAssets.baby4,
  ];
  final List<String> imageTitle = [
    AppStrings.baby1,
    AppStrings.baby2,
    AppStrings.baby3,
    AppStrings.baby4,
  ];

  final List<String> segments = [AppStrings.boy, AppStrings.girl];

  List<Tab> reminderTabs = const [
    Tab(text: AppStrings.health),
    Tab(text: AppStrings.feeding),
    Tab(text: AppStrings.leisure),
    Tab(text: AppStrings.others),
  ];

  final List<Color> indicatorColors = [
    AppColors.primary.withOpacity(0.8),
    AppColors.teal.withOpacity(0.8),
    AppColors.darkBlue.withOpacity(0.7),
    AppColors.spaceCadet.withOpacity(0.6),
  ];

  void navigateToReminderScreen(context, int index) {
    switch (index) {
      case 0:
        AppDialogs.showHealthDialog(context: context);
        break;
      case 1:
        AppDialogs.showFeedingDialog(context: context);
        break;
      case 2:
        AppDialogs.showLeisureDialog(context: context);
        break;
      case 3:
        AppDialogs.showOthersDialog(context: context);
        break;
      default:
        break;
    }
  }
}
