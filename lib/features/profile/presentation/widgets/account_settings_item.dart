import 'package:fitfat/core/extensions/context_color_extension.dart';
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
            color: context.theme.secondColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: context.theme.mainColor,
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
              color: context.theme.blackColor,
            ),
          ),
        ),
        if (trailing != null) trailing!,
        if (trailing == null)
           Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: context.theme.greyColor,
          ),
      ],
    );
  }
}
