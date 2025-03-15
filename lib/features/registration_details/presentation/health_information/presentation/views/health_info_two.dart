import 'package:fitfat/core/constants/light_colors.dart';
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
  });
  final String selectedGender;
  final String dateOfBirth;
  final String weight;
  final String height;
  final String foodAllergies;
  final bool diabetes;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.secondColor,
      body: HealthInfoTwoBody(
        dateOfBirth: dateOfBirth,
        diabetes: diabetes,
        foodAllergies: foodAllergies,
        height: height,
        selectedGender: selectedGender,
        weight: weight,
        userId: userId,
      ),
    );
  }
}
