import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/profile/data/model/diet_info.dart';
import 'package:fitfat/features/profile/presentation/widgets/diet_info_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DietInfoSection extends StatelessWidget {
  const DietInfoSection({
    super.key,
    required this.dietInfo,
  });

  final DietInfo? dietInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Diet Information',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppLightColor.blackColor,
          ),
        ),
        DietInfoList(dietInfo: dietInfo)
      ],
    );
  }
}
