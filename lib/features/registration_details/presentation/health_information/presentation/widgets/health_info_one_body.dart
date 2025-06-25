import 'package:fitfat/features/registration_details/presentation/health_information/presentation/views/health_info_two.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/food_allergy_question_section.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/health_information_upper_text.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/light_colors.dart';

class HealthInfoOneBody extends StatefulWidget {
  const HealthInfoOneBody({
    super.key,
    required this.selectedGender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    this.initialBloodSugarRange = const RangeValues(70, 80),
    this.onBloodSugarRangeChanged,
    required this.userId,
  });
  final String selectedGender;
  final String dateOfBirth;
  final String weight;
  final String height;
  final RangeValues initialBloodSugarRange;
  final Function(RangeValues)? onBloodSugarRangeChanged;
  final String userId;

  @override
  State<HealthInfoOneBody> createState() => _HealthInfoOneBodyState();
}

class _HealthInfoOneBodyState extends State<HealthInfoOneBody> {
  String foodAllergies = "";
  bool diabetes = false;
  String diabetesType = "";
  late RangeValues currentRange;

  @override
  void initState() {
    currentRange = widget.initialBloodSugarRange;
    super.initState();
  }

  void updateFoodAllergies(String allergy, bool isSelected) {
    setState(() {
      if (allergy == "None") {
        foodAllergies = isSelected ? "None" : "";
      } else {
        if (isSelected) {
          foodAllergies = allergy;
        } else if (foodAllergies == allergy) {
          foodAllergies = "";
        }
      }
    });
  }

  void updateDiabetes(bool hasDiabetes) {
    setState(() {
      diabetes = hasDiabetes;
      if (!hasDiabetes) {
        diabetesType = "";
      }
    });
  }

  void updateDiabetesType(String type) {
    setState(() {
      diabetesType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        HealthInformationUpperText(
          userId: widget.userId,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomContainerProfileSetUp(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                FoodAllergyQuestionSection(
                  anyFoodAllergies: foodAllergies,
                  onFoodAllergyChanged: updateFoodAllergies,
                ),
                const SizedBox(height: 30),
                Text(
                  'What is your target blood sugar range?',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppLightColor.blackColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${currentRange.start.toInt()}",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      child: RangeSlider(
                        values: currentRange,
                        min: 70,
                        max: 180,
                        divisions: 11,
                        activeColor: AppLightColor.mainColor,
                        inactiveColor: Colors.grey,
                        onChanged: (RangeValues newRange) {
                          setState(() {
                            currentRange = newRange;
                          });
                          if (widget.onBloodSugarRangeChanged != null) {
                            widget.onBloodSugarRangeChanged!(newRange);
                          }
                        },
                      ),
                    ),
                    Text(
                      "${currentRange.end.toInt()}",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HealthInfoTwo(
                                    dateOfBirth: widget.dateOfBirth,
                                    diabetes: diabetes,
                                    foodAllergies: foodAllergies,
                                    height: widget.height,
                                    selectedGender: widget.selectedGender,
                                    weight: widget.weight,
                                    userId: widget.userId),
                              ));
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
