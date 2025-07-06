import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_cubit.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_state.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/buttons.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_slider.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/light_colors.dart';

class InputMyDietViewBody extends StatefulWidget {
  const InputMyDietViewBody({super.key, required this.userId});
  final String userId;

  @override
  State<InputMyDietViewBody> createState() => _InputMyDietViewBodyState();
}

class _InputMyDietViewBodyState extends State<InputMyDietViewBody> {
  bool isLoading = false;
  String _selectedDietType = '';
  double _proteinPercentage = 30;
  double _carbsPercentage = 40;
  double _fatPercentage = 30;
  double _caloriesValue = 200;
  void _submitDietInfo() async {
    setState(() {
      isLoading = true;
    });
    try {
      final dietInfoCubit = context.read<DietInfoCubit>();

      dietInfoCubit.postDietInfo(
        activityLevel: "none",
        dietType: _selectedDietType,
        dietaryGoals: "none",
        macronutrientGoals: {
          "proteins": _proteinPercentage.round(),
          "carbs": _carbsPercentage.round(),
          "fats": _fatPercentage.round(),
          "calories": _caloriesValue.round(),
        },
        mealPreferences: "Vegetarian",
        userId: widget.userId,
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
      customSnackBar(
        context,
        isError ? "Error" : "Success",
        message,
        isError ? SnackBarType.error : SnackBarType.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DietInfoCubit, DietInfoState>(
      listener: (context, state) {
        if (state is DietInfoLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is DietInfoSuccess) {
          setState(() {
            isLoading = false;
          });
          _showSnackBar('Health information saved successfully!');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginSignUp(context),
            ),
          );
        } else if (state is DietInfoFailure) {
          setState(() {
            isLoading = false;
          });
          _showSnackBar('Error: ${state.errMessage}', isError: true);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What type of diet do you follow?",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      borderColor: AppLightColor.mainColor,
                      widget: "High-Carb",
                      widgetColor: _selectedDietType == "High-Carb"
                          ? Colors.white
                          : AppLightColor.blackColor,
                      background: _selectedDietType == "High-Carb"
                          ? Colors.red
                          : AppLightColor.whiteColor,
                      onPressed: () {
                        setState(() {
                          _selectedDietType = "High-Carb";
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      borderColor: AppLightColor.mainColor,
                      widget: "Low-Carb",
                      widgetColor: _selectedDietType == "Low-Carb"
                          ? Colors.white
                          : AppLightColor.blackColor,
                      background: _selectedDietType == "Low-Carb"
                          ? Colors.red
                          : AppLightColor.whiteColor,
                      onPressed: () {
                        setState(() {
                          _selectedDietType = "Low-Carb";
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      borderColor: AppLightColor.mainColor,
                      widget: "Vegan",
                      widgetColor: _selectedDietType == "Vegan"
                          ? Colors.white
                          : AppLightColor.blackColor,
                      background: _selectedDietType == "Vegan"
                          ? Colors.red
                          : AppLightColor.whiteColor,
                      onPressed: () {
                        setState(() {
                          _selectedDietType = "Vegan";
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      borderColor: AppLightColor.mainColor,
                      widget: "Keto",
                      widgetColor: _selectedDietType == "Keto"
                          ? Colors.white
                          : AppLightColor.blackColor,
                      background: _selectedDietType == "Keto"
                          ? Colors.red
                          : AppLightColor.whiteColor,
                      onPressed: () {
                        setState(() {
                          _selectedDietType = "Keto";
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "Set Your Macronutrient Goals",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              CustomSlider(
                label: "Protein",
                value: _proteinPercentage,
                min: 0,
                max: 100, // Changed from 2000 to 100 for percentage
                onChanged: (value) {
                  setState(() {
                    _proteinPercentage = value;
                    // Adjust other macros to maintain 100% total
                    double remaining = 100 - _proteinPercentage;
                    double ratio = (_carbsPercentage + _fatPercentage) == 0
                        ? 1
                        : (_carbsPercentage /
                            (_carbsPercentage + _fatPercentage));
                    _carbsPercentage = remaining * ratio;
                    _fatPercentage = remaining * (1 - ratio);
                    print('Protein: ${_proteinPercentage.round()}%');
                  });
                },
              ),
              const SizedBox(height: 5),
              CustomSlider(
                label: "Carbs",
                value: _carbsPercentage,
                min: 0,
                max: 100, // Changed from 2000 to 100 for percentage
                onChanged: (value) {
                  setState(() {
                    _carbsPercentage = value;
                    // Adjust other macros to maintain 100% total
                    double remaining = 100 - _carbsPercentage;
                    double ratio = (_proteinPercentage + _fatPercentage) == 0
                        ? 1
                        : (_proteinPercentage /
                            (_proteinPercentage + _fatPercentage));
                    _proteinPercentage = remaining * ratio;
                    _fatPercentage = remaining * (1 - ratio);
                    print('Carbs: ${_carbsPercentage.round()}%');
                  });
                },
              ),
              const SizedBox(height: 5),
              CustomSlider(
                label: "Fats",
                value: _fatPercentage,
                min: 0,
                max: 100, // Changed from 2000 to 100 for percentage
                onChanged: (value) {
                  setState(() {
                    _fatPercentage = value;
                    // Adjust other macros to maintain 100% total
                    double remaining = 100 - _fatPercentage;
                    double ratio = (_proteinPercentage + _carbsPercentage) == 0
                        ? 1
                        : (_proteinPercentage /
                            (_proteinPercentage + _carbsPercentage));
                    _proteinPercentage = remaining * ratio;
                    _carbsPercentage = remaining * (1 - ratio);
                    print('Fats: ${_fatPercentage.round()}%');
                  });
                },
              ),
              const SizedBox(height: 5),
              CustomSlider(
                label: "Calories",
                value: _caloriesValue,
                min: 0,
                max: 400, // Increased from 2000 to provide more flexibility
                onChanged: (value) {
                  setState(() {
                    _caloriesValue = value;
                    print('Calories: ${_caloriesValue.round()}');
                  });
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isLoading
                        ? const CircularProgressIndicator(color: Colors.red)
                        : NextButton(onPressed: () {
                            _submitDietInfo();
                          }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
