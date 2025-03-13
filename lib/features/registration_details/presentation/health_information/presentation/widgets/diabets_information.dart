import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_state.dart';
import 'package:fitfat/features/registration_details/presentation/diet_information/presentation/views/diet_information_view.dart';
import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/suffer_diabetes_question_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';

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
  });

  final double initialInsulinRatio;
  final Function(double)? onInsulinRatioChanged;
  final Function(bool) onDiabetesChanged;
  final int weight;
  final int height;
  final String dateOfBirth;
  final String gender;
  final List<String> foodAllergies;
  final String userId;

  @override
  State<DiabetsInformation> createState() => _DiabetsInformationState();
}

class _DiabetsInformationState extends State<DiabetsInformation> {
  late double insulinRatio;
  bool hasDiabetes = false;
  String diabetesType = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    insulinRatio = widget.initialInsulinRatio;
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

      healthInfoCubit.postHealthInfo(
        foodAllergies: widget.foodAllergies,
        diabetes: diabetesValue,
        weight: widget.weight,
        height: widget.height,
        dateOfBirth: widget.dateOfBirth,
        gender: widget.gender,
        targetBloodSugarRange: targetBloodSugarRange,
        userId: widget.userId,
        diabetesType: diabetesType, // Pass the diabetes type
        insulinRatio: insulinRatio, // Pass the insulin ratio
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

          // Navigate only after successful posting
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What type of diabetes do you have?',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Type 1',
                        groupValue: diabetesType,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            diabetesType = value!;
                          });
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type 1',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '"Your Body Doesn\'t Produce Insulin"',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Type 2',
                        groupValue: diabetesType,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            diabetesType = value!;
                          });
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type 2',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '"Your Body Doesn\'t Use Insulin Properly"',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                'What is your Insulin-to-Carb Ratio?',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Text(
                    '1:',
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "10",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: AppLightColor.greyColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      initialValue:
                          insulinRatio > 0 ? insulinRatio.toString() : '',
                      onChanged: (value) {
                        final ratio = double.tryParse(value) ?? 0.0;
                        setState(() {
                          insulinRatio = ratio;
                        });
                        if (widget.onInsulinRatioChanged != null) {
                          widget.onInsulinRatioChanged!(ratio);
                        }
                      },
                    ),
                  ),
                ],
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
                      : NextButton(onPressed: () {
                          if (hasDiabetes && diabetesType.isEmpty) {
                            _showSnackBar('Please select diabetes type',
                                isError: true);
                            return;
                          }

                          if (hasDiabetes && insulinRatio <= 0) {
                            _showSnackBar('Please enter a valid insulin ratio',
                                isError: true);
                            return;
                          }

                          _submitHealthInfo();
                        }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
