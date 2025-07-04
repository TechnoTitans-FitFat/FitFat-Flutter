import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/answers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodAllergyQuestionSection extends StatelessWidget {
  const FoodAllergyQuestionSection({
    super.key,
    required this.anyFoodAllergies,
    required this.onFoodAllergyChanged,
  });

  final String anyFoodAllergies;
  final Function(String, bool) onFoodAllergyChanged;

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
            color: context.theme.blackColor,
          ),
        ),
        Text(
          '"You can choose more than one option"',
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: context.theme.blackColor.withOpacity(.6),
          ),
        ),
        Answers(
          anyFoodAllergies: anyFoodAllergies,
          onFoodAllergyChanged: onFoodAllergyChanged,
        ),
      ],
    );
  }
}
