import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';

class SettingsListTile extends StatelessWidget {
  final GestureTapCallback? onTap;
  final IconData icon;
  final String title;
  final Widget? trailing;

  const SettingsListTile({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColors.black),
      ),
      splashColor: AppColors.primary.withOpacity(0.4),
      trailing:  trailing,
    );
  }
}
