import 'package:fitfat/core/cubit/theme/theme_state.dart';
import 'package:fitfat/features/profile/presentation/widgets/account_settings_item.dart';
import 'package:fitfat/features/settings/presentation/views/account_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/light_colors.dart';
import '../../../../core/cubit/theme/theme_cubit.dart';

class GenaralSettingsList extends StatelessWidget {
  const GenaralSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AccountSettingsItem(
          icon: Icons.language,
          title: 'Language',
          trailing: null,
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final themeCubit = ThemeCubit.of(context);
            return AccountSettingsItem(
              icon: Icons.dark_mode,
              title: 'Dark Mode',
              trailing: Switch(
                value: themeCubit.isDarkMode,
                onChanged: (bool value) {
                  themeCubit.toggleTheme();
                },
                activeColor: AppLightColor.mainColor,
              ),
            );
          },
        ),
        const AccountSettingsItem(
          icon: Icons.support_agent,
          title: 'Contact Support',
          trailing: null,
        ),
        AccountSettingsItem(
          icon: Icons.settings,
          title: 'Account Settings',
          trailing: null,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountSettingsView(),
              ),
            );
          },
        ),
      ],
    );
  }
}
