import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/config/themes/app_theme.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class Bebop extends StatelessWidget {
  const Bebop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
