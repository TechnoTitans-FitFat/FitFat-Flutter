import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/health/presentation/widgets/answers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodAllergyQuestionSection extends StatelessWidget {
  const FoodAllergyQuestionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Do you have any food allergies?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppLightColor.blackColor,
          ),
        ),
        Text(
          '“You can choose more than one option”',
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppLightColor.blackColor.withOpacity(.6),
          ),
        ),
        const Answers(),
      ],
    );
  }
}
