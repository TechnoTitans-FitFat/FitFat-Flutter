import 'package:fitfat/features/profile/data/model/health_info.dart';
import 'package:fitfat/features/profile/presentation/widgets/health_info_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthInfoSection extends StatelessWidget {
  const HealthInfoSection({
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
          'Health Information',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        HealthInfoList(healthInfo: healthInfo),
      ],
    );
  }
}
