import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/current_page_indicator_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthInformationUpperTextTwo extends StatelessWidget {
  const HealthInformationUpperTextTwo({
    super.key,
    required this.userId,
    required this.foodAllergies,
    required this.targetBloodSugarRange,
    required this.selectedGender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.onCorrectionFactor,
    required this.onDiabetesChanged,
    required this.initialInsulinToCardRatio,
    required this.onDiabetesTypeChanged, // Added
    required this.diabetesType, // Added
    required this.correctionFactor, // Added
  });
  final String userId;
  final String foodAllergies;
  final Map<String, int> targetBloodSugarRange;
  final String selectedGender;
  final String dateOfBirth;
  final String weight;
  final String height;
  final void Function(double ratio) onCorrectionFactor;
  final void Function(bool status) onDiabetesChanged;
  final double initialInsulinToCardRatio;
  final void Function(String type) onDiabetesTypeChanged; // Added
  final String diabetesType; // Added
  final double correctionFactor; // Added

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile Setup",
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppLightColor.mainColor,
                ),
              ),
              SkipButton(
                userId: userId,
                foodAllergies: foodAllergies,
                targetBloodSugarRange: targetBloodSugarRange,
                dateOfBirth: dateOfBirth,
                gender: selectedGender,
                height: int.parse(height),
                weight: int.parse(weight),
                correctionFactor: correctionFactor,
                hasDiabetes: true, // Assuming diabetes is relevant
                insulinToCardRatio: initialInsulinToCardRatio,
                diabetesType: diabetesType, // Pass diabetesType
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const CurrentPageIndicatorSection(
            currentPageTitle: 'Health Information',
            nextPageTitle: 'Next: Diet Information',
            value: 2,
            step: 2,
          ),
        ],
      ),
    );
  }
}
