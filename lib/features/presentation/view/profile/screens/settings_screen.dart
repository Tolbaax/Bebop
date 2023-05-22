import 'package:bebop/core/functions/app_dialogs.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../components/appbar_back_button.dart';
import '../../layout/cubit/cubit.dart';
import '../cubit/cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool isNotification = false;
  late bool isDark = false;

  //String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
        leading: const AppBarBackButton(),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.user,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.userInformation,
              style: TextStyle(color: AppColors.black),
            ),
            splashColor: AppColors.primary,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.baby,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.babyInformation,
              style: TextStyle(color: AppColors.black),
            ),
            splashColor: AppColors.primary,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.lock,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.changePass,
              style: TextStyle(color: AppColors.black),
            ),
            splashColor: AppColors.primary,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.language,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.language,
              style: TextStyle(color: AppColors.black),
            ),
            splashColor: AppColors.primary,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.palette,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.darkTheme,
              style: TextStyle(color: AppColors.black),
            ),
            splashColor: AppColors.primary,
            trailing: Switch(
              value: isDark,
              onChanged: (bool value) {
                setState(() {
                  isDark = !isDark;
                });
              },
              activeColor: AppColors.primary,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.notifications_none,
              color: AppColors.primary,
              size: 22.0.sp,
            ),
            title: Text(
              AppStrings.notification,
              style: TextStyle(color: AppColors.black),
            ),
            splashColor: AppColors.primary,
            trailing: Switch(
              value: isNotification,
              onChanged: (bool value) {
                setState(() {
                  isNotification = !isNotification;
                });
              },
              activeColor: AppColors.primary,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              FontAwesomeIcons.message,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.contactUs,
              style: TextStyle(color: AppColors.black),
            ),
            splashColor: AppColors.primary,
          ),
          ListTile(
            onTap: () => AppDialogs.showLogOutDialog(
              context: context,
              onPressed: () {
                ProfileCubit.get(context).signOut().then((value) {
                  navigateAndRemove(context, Routes.login);
                });
                LayoutCubit.get(context).selectedIndex = 0;
              },
            ),
            leading: Icon(
              FontAwesomeIcons.rightFromBracket,
              color: AppColors.primary,
            ),
            title: Text(
              AppStrings.logout,
              style: TextStyle(color: AppColors.black),
            ),
            splashColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
