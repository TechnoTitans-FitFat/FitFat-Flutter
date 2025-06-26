import 'package:fitfat/features/profile/presentation/widgets/account_settings_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/light_colors.dart';

class GenaralSettingsList extends StatelessWidget {
  const GenaralSettingsList({
    super.key,
    required this.isDarkMode,
  });

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AccountSettingsItem(
          icon: Icons.language,
          title: 'Language',
          trailing: null,
        ),
        AccountSettingsItem(
          icon: Icons.dark_mode,
          title: 'Dark Mode',
          trailing: Switch(
            value: isDarkMode,
            onChanged: (bool value) {},
            activeColor: AppLightColor.mainColor,
          ),
        ),
        const AccountSettingsItem(
          icon: Icons.support_agent,
          title: 'Contact Support',
          trailing: null,
        ),
        const AccountSettingsItem(
          icon: Icons.settings,
          title: 'Account Settings',
          trailing: null,
        ),
      ],
    );
  }
}
