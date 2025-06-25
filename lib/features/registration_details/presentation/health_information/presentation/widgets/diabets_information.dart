import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_state.dart';
import 'package:fitfat/features/registration_details/presentation/diet_information/presentation/views/diet_information_view.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/correction_factor_section.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/diabetes_type_section.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/insulin_ratio_section.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/suffer_diabetes_question_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiabetsInformation extends StatefulWidget {
  const DiabetsInformation({
    super.key,
    this.initialInsulinRatio = 0.0,
    this.onInsulinRatioChanged,
    required this.onDiabetesChanged,
    required this.weight,
    required this.height,
    required this.dateOfBirth,
    required this.gender,
    required this.foodAllergies,
    required this.userId,
    this.onCorrectionFactor,
  });

  final double initialInsulinRatio;
  final Function(double)? onInsulinRatioChanged;
  final Function(double)? onCorrectionFactor;
  final Function(bool) onDiabetesChanged;
  final int weight;
  final int height;
  final String dateOfBirth;
  final String gender;
  final String foodAllergies;
  final String userId;

  @override
  State<DiabetsInformation> createState() => _DiabetsInformationState();
}

class _DiabetsInformationState extends State<DiabetsInformation> {
  late double insulinRatio;
  bool hasDiabetes = false;
  String diabetesType = "";
  bool isLoading = false;
  late double correctionFactor;

  @override
  void initState() {
    super.initState();
    insulinRatio = widget.initialInsulinRatio;
    correctionFactor = 0.0;
  }

  void _submitHealthInfo() async {
    // Validate required fields
    if (widget.dateOfBirth.isEmpty) {
      _showSnackBar('Date of birth is required', isError: true);
      return;
    }

    if (widget.gender.isEmpty) {
      _showSnackBar('Gender is required', isError: true);
      return;
    }

    setState(() {
      isLoading = true;
    });
    final Map<String, int> targetBloodSugarRange = {
      'min': 70,
      'max': 180,
    };

    try {
      final healthInfoCubit = context.read<HealthInfoCubit>();

      final int diabetesValue = hasDiabetes ? 1 : 0;

      await healthInfoCubit.postHealthInfo(
        foodAllergies: widget.foodAllergies,
        diabetes: diabetesValue,
        weight: widget.weight,
        height: widget.height,
        dateOfBirth: widget.dateOfBirth,
        gender: widget.gender,
        targetBloodSugarRange: targetBloodSugarRange,
        userId: widget.userId,
        diabetesType: diabetesType,
        insulinRatio: insulinRatio,
        correctionfactor: correctionFactor,
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showSnackBar('Error: ${e.toString()}', isError: true);
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HealthInfoCubit, HealthInfoState>(
      listener: (context, state) {
        if (state is HealthInfoLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is HealthInfoSuccess) {
          setState(() {
            isLoading = false;
          });
          _showSnackBar('Health information saved successfully!');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DietInformationView(
                userId: widget.userId,
              ),
            ),
          );
        } else if (state is HealthInfoFailure) {
          setState(() {
            isLoading = false;
          });
          _showSnackBar('Error: ${state.errMessage}', isError: true);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            SufferDiabetesQuestionSection(
              hasDiabetes: hasDiabetes,
              diabetesType: diabetesType,
              onDiabetesChanged: (value) {
                setState(() {
                  hasDiabetes = value;
                  if (!value) {
                    diabetesType = "";
                    insulinRatio = 0.0;
                    correctionFactor = 0.0;
                  }
                });
                widget.onDiabetesChanged(value);
              },
              onDiabetesTypeChanged: (type) {
                setState(() {
                  diabetesType = type;
                });
              },
            ),
            if (hasDiabetes) ...[
              const SizedBox(height: 40),
              DiabetesTypeSection(
                diabetesType: diabetesType,
                onDiabetesTypeChanged: (type) {
                  setState(() {
                    diabetesType = type;
                  });
                },
              ),
              const SizedBox(height: 20),
              InsulinRatioSection(
                insulinRatio: insulinRatio,
                onInsulinRatioChanged: (ratio) {
                  setState(() {
                    insulinRatio = ratio;
                  });
                  if (widget.onInsulinRatioChanged != null) {
                    widget.onInsulinRatioChanged!(ratio);
                  }
                },
              ),
              const SizedBox(height: 20),
              CorrectionFactorSection(
                correctionFactor: correctionFactor,
                onCorrectionFactorChanged: (factor) {
                  setState(() {
                    correctionFactor = factor;
                  });
                  if (widget.onCorrectionFactor != null) {
                    widget.onCorrectionFactor!(factor);
                  }
                },
              ),
            ],
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isLoading
                      ? const CircularProgressIndicator(color: Colors.red)
                      : NextButton(
                          onPressed: _submitHealthInfo,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
