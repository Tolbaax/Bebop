import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

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
}
