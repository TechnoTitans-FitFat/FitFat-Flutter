import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/custom_card_answer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SufferDiabetesQuestionSection extends StatelessWidget {
  const SufferDiabetesQuestionSection({
    super.key,
    required this.hasDiabetes,
    required this.diabetesType,
    required this.onDiabetesChanged,
    required this.onDiabetesTypeChanged,
  });

  final bool hasDiabetes;
  final String diabetesType;
  final Function(bool) onDiabetesChanged;
  final Function(String) onDiabetesTypeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Do you suffer from type of diabetes?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppLightColor.blackColor,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            CustomCardAnswer(
              title: 'Yes',
              isSelected: hasDiabetes,
              onTap: () => onDiabetesChanged(true),
            ),
            const SizedBox(width: 25),
            CustomCardAnswer(
              title: 'No',
              isSelected: !hasDiabetes,
              onTap: () => onDiabetesChanged(false),
            ),
          ],
        ),
      ],
    );
  }
}
