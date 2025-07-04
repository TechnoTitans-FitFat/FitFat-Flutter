import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/current_page_indicator_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/diet_determination_way_selection.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DietInformationView extends StatelessWidget {
  const DietInformationView({
    super.key,
    required this.userId,
    required this.selectedGender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.foodAllergies,
    required this.diabetes,
    required this.bloodSugarRange,
    this.diabetesType = '', // Added
    this.insulinToCardRatio = 0.0, // Added
    this.correctionFactor = 0.0, // Added
  });

  final String userId;
  final String selectedGender;
  final String dateOfBirth;
  final String weight;
  final String height;
  final String foodAllergies;
  final bool diabetes;
  final RangeValues bloodSugarRange;
  final String diabetesType; // Added
  final double insulinToCardRatio; // Added
  final double correctionFactor; // Added

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.secondColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
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
                      hasDiabetes: diabetes,
                      userId: userId,
                      dateOfBirth: dateOfBirth,
                      foodAllergies: foodAllergies,
                      gender: selectedGender,
                      height: int.parse(height),
                      weight: int.parse(weight),
                      targetBloodSugarRange: {
                        "min": bloodSugarRange.start.toInt(),
                        "max": bloodSugarRange.end.toInt(),
                      },
                      diabetesType: diabetesType,
                      insulinToCardRatio: insulinToCardRatio,
                      correctionFactor: correctionFactor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const CurrentPageIndicatorSection(
                  nextPageTitle: "Next: Start Your Journey!",
                  currentPageTitle: "Diet Information",
                  value: 3,
                  step: 3,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomContainerProfileSetUp(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
              child: DietDeterminationWaySelection(
                userId: userId,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
