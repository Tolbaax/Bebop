import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../components/buttons/appbar_back_button.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(AppStrings.notifications),
      ),
    );
  }
}
