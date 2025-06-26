import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/profile/data/model/health_info.dart';
import 'package:fitfat/features/profile/presentation/widgets/general_info_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralInfoSection extends StatelessWidget {
  const GeneralInfoSection({
    super.key,
    required this.healthInfo,
  });

  final HealthInfo? healthInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General Information',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppLightColor.blackColor,
          ),
        ),
        GeneralInfoList(healthInfo: healthInfo),
      ],
    );
  }
}
