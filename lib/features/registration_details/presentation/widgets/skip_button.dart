import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main/presentaion/views/main_screen.dart';
import '../../data/cubit/diet_info_cubit/diet_info_state.dart';
import '../../data/cubit/health_info_cubit/health_info_state.dart';

class SkipButton extends StatelessWidget {
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
  final double? insulinRatio;
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
    this.insulinRatio,
    this.correctionFactor,
  });

  void _submitInfo(BuildContext context) async {
    try {
      final dietInfoCubit = context.read<DietInfoCubit>();
      final healthInfoCubit = context.read<HealthInfoCubit>();

      // Submit diet information
      dietInfoCubit.postDietInfo(
        activityLevel: selectedActivityLevel ?? "Moderately Active",
        dietType: "Keto",
        dietaryGoals: selectedDietGoal ?? "Weight loss",
        macronutrientGoals: {
          "proteins": 0,
          "carbs": 0,
          "fats": 0,
          "calories": 0,
        },
        mealPreferences: selectedMealType ?? "Vegetarian",
        userId: userId,
      );

      // Submit health information
      final int diabetesValue = hasDiabetes ?? false ? 1 : 0;
      await healthInfoCubit.postHealthInfo(
        foodAllergies: foodAllergies ?? "",
        diabetes: diabetesValue,
        weight: weight ?? 50,
        height: height ?? 150,
        dateOfBirth: dateOfBirth ?? "1990-01-01T00:00:00.000Z",
        gender: gender ?? "Female",
        targetBloodSugarRange: targetBloodSugarRange ?? {"min": 70, "max": 180},
        userId: userId,
        diabetesType: diabetesType ?? "",
        insulinRatio: insulinRatio ?? 0.0,
        correctionfactor: correctionFactor ?? 0.0,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool dietSuccess = false;
    bool healthSuccess = false;
    bool isLoading = false;

    return MultiBlocListener(
      listeners: [
        BlocListener<DietInfoCubit, DietInfoState>(
          listener: (context, state) {
            if (state is DietInfoLoading) {
              isLoading = true;
            } else if (state is DietInfoSuccess) {
              isLoading = false;
              dietSuccess = true;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Diet information saved successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              if (dietSuccess && healthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              }
            } else if (state is DietInfoFailure) {
              isLoading = false;
              dietSuccess = false;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.errMessage}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
        BlocListener<HealthInfoCubit, HealthInfoState>(
          listener: (context, state) {
            if (state is HealthInfoLoading) {
              isLoading = true;
            } else if (state is HealthInfoSuccess) {
              isLoading = false;
              healthSuccess = true;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Health information saved successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              if (dietSuccess && healthSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              }
            } else if (state is HealthInfoFailure) {
              isLoading = false;
              healthSuccess = false;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: ${state.errMessage}'),
                  backgroundColor: Colors.red,
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
