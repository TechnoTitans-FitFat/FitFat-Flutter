import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../main/presentaion/views/main_screen.dart';
import '../../data/cubit/diet_info_cubit/diet_info_state.dart';
import '../../data/cubit/health_info_cubit/health_info_state.dart';

class SkipButton extends StatefulWidget {
  final String userId;
  final int? weight;
  final int? height;
  final String? dateOfBirth;
  final String? gender;
  final String? selectedActivityLevel;
  final String? selectedDietGoal;
  final String? selectedMealType;
  final String? foodAllergies;
  final bool? hasDiabetes;
  final Map<String, int>? targetBloodSugarRange;
  final String? diabetesType;
  final double? insulinToCardRatio;
  final double? correctionFactor;

  const SkipButton({
    super.key,
    required this.userId,
    this.weight,
    this.height,
    this.dateOfBirth,
    this.gender,
    this.selectedActivityLevel,
    this.selectedDietGoal,
    this.selectedMealType,
    this.foodAllergies,
    this.hasDiabetes,
    this.targetBloodSugarRange,
    this.diabetesType,
    this.insulinToCardRatio,
    this.correctionFactor,
  });

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> {
  bool dietSuccess = false;
  bool healthSuccess = false;
  bool isLoading = false;

  void _submitInfo(BuildContext context) async {
    try {
      final dietInfoCubit = context.read<DietInfoCubit>();
      final healthInfoCubit = context.read<HealthInfoCubit>();

      final dietState = dietInfoCubit.state;
      final healthState = healthInfoCubit.state;

      if (!dietSuccess && dietState is! DietInfoSuccess) {
        dietInfoCubit.postDietInfo(
          activityLevel: widget.selectedActivityLevel ?? "Moderately Active",
          dietType: "Keto",
          dietaryGoals: widget.selectedDietGoal ?? "Weight loss",
          macronutrientGoals: {
            "proteins": 0,
            "carbs": 0,
            "fats": 0,
            "calories": 0,
          },
          mealPreferences: widget.selectedMealType ?? "Vegetarian",
          userId: widget.userId,
        );
      } else if (dietState is DietInfoSuccess) {
        dietSuccess = true;
      }

      String? result;
      if (widget.dateOfBirth != null) {
        final inputFormat = DateFormat('dd/MM/yyyy');
        final localDate = inputFormat.parse(widget.dateOfBirth!);
        final utcDateTime =
            DateTime.utc(localDate.year, localDate.month, localDate.day);
        final outputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        result = outputFormat.format(utcDateTime);
      }

      if (!healthSuccess && healthState is! HealthInfoSuccess) {
        await healthInfoCubit.postHealthInfo(
          foodAllergies: widget.foodAllergies ?? "",
          diabetes: widget.hasDiabetes ?? false ? 1 : 0,
          weight: widget.weight ?? 50,
          height: widget.height ?? 150,
          dateOfBirth: result ?? "1990-01-01T00:00:00.000Z",
          gender: widget.gender ?? "Female",
          targetBloodSugarRange:
              widget.targetBloodSugarRange ?? {"min": 70, "max": 180},
          userId: widget.userId,
          diabetesType: widget.diabetesType ?? "",
          insulinToCardRatio: widget.insulinToCardRatio ?? 0.0,
          correctionfactor: widget.correctionFactor ?? 0.0,
        );
      } else if (healthState is HealthInfoSuccess) {
        healthSuccess = true;
      }
      if (dietSuccess && healthSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginSignUp(isLoading),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        customSnackBar(
          context,
          "Error",
          "Unexpected error occurred!",
          SnackBarType.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DietInfoCubit, DietInfoState>(
          listener: (context, state) {
            if (state is DietInfoLoading) {
              setState(() {
                isLoading = true;
              });
            } else if (state is DietInfoSuccess) {
              setState(() {
                isLoading = false;
                dietSuccess = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  context,
                  "Success",
                  "Diet Info Added Successfully",
                  SnackBarType.success,
                ),
              );
              if (dietSuccess && healthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginSignUp(isLoading),
                  ),
                );
              }
            } else if (state is DietInfoFailure) {
              setState(() {
                isLoading = false;
                dietSuccess = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  context,
                  "Error",
                  "Diet Info failed to save",
                  SnackBarType.error,
                ),
              );
            }
          },
        ),
        BlocListener<HealthInfoCubit, HealthInfoState>(
          listener: (context, state) {
            if (state is HealthInfoLoading) {
              setState(() {
                isLoading = true;
              });
            } else if (state is HealthInfoSuccess) {
              setState(() {
                isLoading = false;
                healthSuccess = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  context,
                  "Success",
                  "Health information saved successfully!",
                  SnackBarType.success,
                ),
              );
              if (dietSuccess && healthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginSignUp(isLoading),
                  ),
                );
              }
            } else if (state is HealthInfoFailure) {
              setState(() {
                isLoading = false;
                healthSuccess = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  context,
                  "Error",
                  "Health info failed to save",
                  SnackBarType.error,
                ),
              );
            }
          },
        ),
      ],
      child: ElevatedButton(
        onPressed: () => _submitInfo(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppLightColor.secondColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppLightColor.greyColor),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppLightColor.greyColor,
              )
            : const Row(
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                      color: AppLightColor.greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: AppLightColor.greyColor,
                  ),
                ],
              ),
      ),
    );
  }
}
