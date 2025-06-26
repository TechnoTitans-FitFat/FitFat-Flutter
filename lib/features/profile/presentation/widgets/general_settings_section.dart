import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/profile/presentation/widgets/genaral_settings_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralSettingsSection extends StatelessWidget {
  const GeneralSettingsSection({
    super.key,
    required this.context,
    required this.isDarkMode,
  });

  final BuildContext context;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.85,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppLightColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General Settings',
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppLightColor.mainColor,
            ),
          ),
          GenaralSettingsList(isDarkMode: isDarkMode)
        ],
      ),
    );
  }
}
