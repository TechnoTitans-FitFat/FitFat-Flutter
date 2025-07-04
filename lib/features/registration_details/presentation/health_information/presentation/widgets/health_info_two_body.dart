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
    required this.bloodSugarRange,
    this.diabetesType = '', // Added diabetesType with default empty string
  });
  final String selectedGender;
  final String dateOfBirth;
  final String weight;
  final String height;
  final String foodAllergies;
  final bool diabetes;
  final String userId;
  final RangeValues bloodSugarRange;
  final String diabetesType; // New parameter

  @override
  State<HealthInfoTwoBody> createState() => _HealthInfoTwoBodyState();
}

class _HealthInfoTwoBodyState extends State<HealthInfoTwoBody> {
  double insulinToCardRatio = 0.0;
  bool hasDiabetes = false;
  double correctionFactor = 0.0;
  String diabetesType = ''; // Added state for diabetesType

  @override
  void initState() {
    super.initState();
    hasDiabetes = widget.diabetes;
    diabetesType = widget.diabetesType; // Initialize with widget value
  }

  void updateDiabetesStatus(bool status) {
    setState(() {
      hasDiabetes = status;
      if (!status) {
        insulinToCardRatio = 0.0;
        diabetesType = ''; // Reset diabetesType if no diabetes
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

  void updateDiabetesType(String type) {
    setState(() {
      diabetesType = type;
    });
  }

  void navigateToDietInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DietInformationView(
          userId: widget.userId,
          selectedGender: widget.selectedGender,
          bloodSugarRange: widget.bloodSugarRange,
          dateOfBirth: widget.dateOfBirth,
          height: widget.height,
          weight: widget.weight,
          diabetes: hasDiabetes,
          foodAllergies: widget.foodAllergies,
          diabetesType: diabetesType, // Pass diabetesType
          insulinToCardRatio: insulinToCardRatio, // Pass insulin to card ratio
          correctionFactor: correctionFactor, // Pass correction factor
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
        HealthInformationUpperTextTwo(
          dateOfBirth: widget.dateOfBirth,
          height: widget.height,
          weight: widget.weight,
          selectedGender: widget.selectedGender,
          foodAllergies: widget.foodAllergies,
          targetBloodSugarRange: {
            "min": widget.bloodSugarRange.start.toInt(),
            "max": widget.bloodSugarRange.end.toInt(),
          },
          userId: widget.userId,
          onDiabetesChanged: updateDiabetesStatus,
          onCorrectionFactor: updateCorrectionFactor,
          initialInsulinToCardRatio: insulinToCardRatio,
          onDiabetesTypeChanged: updateDiabetesType, // Pass update function
          diabetesType: diabetesType, // Pass diabetesType
          correctionFactor: correctionFactor, // Pass correctionFactor
        ),
        const SizedBox(
          height: 30,
        ),
        CustomContainerProfileSetUp(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: DiabetsInformation(
              initialInsulinToCardRatio: insulinToCardRatio,
              onInsulinToCardRatioChanged: updateInsulinToCardRatio,
              onDiabetesChanged: updateDiabetesStatus,
              weight: int.parse(widget.weight),
              height: int.parse(widget.height),
              dateOfBirth: widget.dateOfBirth,
              gender: widget.selectedGender,
              foodAllergies: widget.foodAllergies,
              userId: widget.userId,
              onCorrectionFactor: updateCorrectionFactor,
              bloodSugarRange: widget.bloodSugarRange,
              onDiabetesTypeChanged: updateDiabetesType, // Pass update function
              diabetesType: diabetesType, // Pass diabetesType
            ),
          ),
        ),
      ],
    );
  }
}
