import 'package:bebop/core/functions/app_dialogs.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/presentation/view/settings/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/functions/navigation.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../components/buttons/appbar_back_button.dart';
import '../../layout/cubit/cubit.dart';
import '../../profile/cubit/cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool isNotification = false;
  late bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
        leading: const AppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsListTile(
              onTap: () {},
              icon: FontAwesomeIcons.user,
              title: AppStrings.userInformation,
            ),
            SettingsListTile(
              onTap: () => navigateTo(context, Routes.babyInformation),
              icon: FontAwesomeIcons.baby,
              title: AppStrings.babyInformation,
            ),
            SettingsListTile(
              onTap: () {},
              icon: FontAwesomeIcons.lock,
              title: AppStrings.changePass,
            ),
            SettingsListTile(
              onTap: () {},
              icon: FontAwesomeIcons.language,
              title: AppStrings.language,
            ),
            SettingsListTile(
              onTap: () {},
              icon: FontAwesomeIcons.palette,
              title: AppStrings.darkTheme,
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
            SettingsListTile(
              onTap: () {},
              icon: FontAwesomeIcons.bell,
              title: AppStrings.notification,
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
            SettingsListTile(
              onTap: () {},
              icon: FontAwesomeIcons.message,
              title: AppStrings.contactUs,
            ),
            SettingsListTile(
              onTap: () => AppDialogs.showLogOutDialog(
                context: context,
                onPressed: () {
                  ProfileCubit.get(context).signOut().then((value) {
                    navigateAndRemove(context, Routes.login);
                    ProfileCubit.get(context).memoriesFetched = false;
                  });
                  LayoutCubit.get(context).selectedIndex = 0;
                },
              ),
              icon: FontAwesomeIcons.rightFromBracket,
              title: AppStrings.logout,
            ),
          ],
        ),
      ),
    );
  }
}
