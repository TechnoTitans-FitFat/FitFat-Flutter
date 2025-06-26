import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSettingsItem extends StatelessWidget {
  const AccountSettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
  });
  final IconData icon;
  final String title;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppLightColor.secondColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppLightColor.mainColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.openSans(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppLightColor.blackColor,
            ),
          ),
        ),
        if (trailing != null) trailing!,
        if (trailing == null)
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppLightColor.greyColor,
          ),
      ],
    );
  }
}
