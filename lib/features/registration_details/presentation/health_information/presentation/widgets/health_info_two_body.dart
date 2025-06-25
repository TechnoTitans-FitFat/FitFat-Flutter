import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/health_information_upper_text_two.dart';
import 'package:fitfat/features/registration_details/presentation/diet_information/presentation/views/diet_information_view.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/diabets_information.dart';
import 'package:flutter/material.dart';

class HealthInfoTwoBody extends StatefulWidget {
  const HealthInfoTwoBody({
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
  State<HealthInfoTwoBody> createState() => _HealthInfoTwoBodyState();
}

class _HealthInfoTwoBodyState extends State<HealthInfoTwoBody> {
  double insulinToCardRatio = 0.0;
  bool hasDiabetes = false;
  double correctionFactor = 0.0;

  @override
  void initState() {
    super.initState();
    hasDiabetes = widget.diabetes;
  }

  void updateDiabetesStatus(bool status) {
    setState(() {
      hasDiabetes = status;
      if (!status) {
        insulinToCardRatio = 0.0;
      }
    });
  }

  void updateInsulinToCardRatio(double ratio) {
    setState(() {
      insulinToCardRatio = ratio;
    });
  }

  void updateCorrectionFactor(double ratio) {
    setState(() {
      correctionFactor = ratio;
    });
  }

  void navigateToDietInfo() {
    // Create a complete health info object to pass to the next screen or save
    final Map<String, dynamic> healthInfo = {
      "gender": widget.selectedGender,
      "dateOfBirth": widget.dateOfBirth,
      "weight": double.tryParse(widget.weight) ?? 0.0,
      "height": double.tryParse(widget.height) ?? 0.0,
      "foodAllergies": widget.foodAllergies,
      "diabetes": hasDiabetes,
      "insulinToCardRatio": insulinToCardRatio,
    };

    // Print for debugging (you can remove this in production)
    print("Health Info to be saved: $healthInfo");

    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DietInformationView(
          userId: widget.userId,
          // healthInfo: healthInfo,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const HealthInformationUpperTextTwo(),
        const SizedBox(
          height: 30,
        ),
        CustomContainerProfileSetUp(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: DiabetsInformation(
              initialInsulinRatio: insulinToCardRatio,
              onInsulinRatioChanged: updateInsulinToCardRatio,
              onDiabetesChanged: updateDiabetesStatus,
              weight: int.parse(widget.weight),
              height: int.parse(widget.height),
              dateOfBirth: widget.dateOfBirth,
              gender: widget.selectedGender,
              foodAllergies: widget.foodAllergies,
              userId: widget.userId,
              onCorrectionFactor: updateCorrectionFactor,
            ),
          ),
        ),
      ],
    );
  }
}
