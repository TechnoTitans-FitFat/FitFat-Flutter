import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/health_info_two_body.dart';
import 'package:flutter/material.dart';

class HealthInfoTwo extends StatelessWidget {
  const HealthInfoTwo({
    super.key,
    required this.selectedGender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.foodAllergies,
    required this.diabetes,
    required this.userId,
    required this.bloodSugarRange,
  });
  final String selectedGender;
  final String dateOfBirth;
  final String weight;
  final String height;
  final String foodAllergies;
  final bool diabetes;
  final String userId;
  final RangeValues bloodSugarRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.mainColor,
      body: HealthInfoTwoBody(
        dateOfBirth: dateOfBirth,
        diabetes: diabetes,
        foodAllergies: foodAllergies,
        height: height,
        selectedGender: selectedGender,
        weight: weight,
        userId: userId,
        bloodSugarRange: bloodSugarRange,
      ),
    );
  }
}
