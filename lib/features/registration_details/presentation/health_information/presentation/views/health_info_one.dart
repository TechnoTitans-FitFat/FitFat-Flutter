import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/health_info_one_body.dart';
import 'package:flutter/material.dart';

class HealthInfoOne extends StatelessWidget {
  const HealthInfoOne({
    super.key,
    required this.selectedGender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.userId,
  });
  final String selectedGender;
  final String dateOfBirth;
  final String weight;
  final String height;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.secondColor,
      body: HealthInfoOneBody(
        dateOfBirth: dateOfBirth,
        height: height,
        selectedGender: selectedGender,
        weight: weight,
        userId: userId,
      ),
    );
  }
}
