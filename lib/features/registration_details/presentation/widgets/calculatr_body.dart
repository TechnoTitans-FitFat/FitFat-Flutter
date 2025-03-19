import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_state.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/activity_radio_button.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/diet_goals_selection.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/type_of_meal_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/cubit/diet_info_cubit/diet_info_cubit.dart';

class CalculatrBody extends StatefulWidget {
  const CalculatrBody({super.key, required this.userId});
  final String userId;
  @override
  State<CalculatrBody> createState() => _CalculatrBodyState();
}

class _CalculatrBodyState extends State<CalculatrBody> {
  String selectedActivityLevel = '';
  String selectedMealType = '';
  String selectedDietGoal = '';
  bool isLoading = false;

  void _handleActivityLevelSelected(String level) {
    setState(() {
      selectedActivityLevel = level;
    });
    print('Selected activity level: $level');
  }

  void _handleMealTypeSelected(String mealType) {
    setState(() {
      selectedMealType = mealType;
    });
    print('Selected meal type: $mealType');
  }

  void _handleDietGoalSelected(String dietGoal) {
    setState(() {
      selectedDietGoal = dietGoal;
    });
    print('Selected diet goal: $dietGoal');
  }

  void _submitDietInfo() async {
    setState(() {
      isLoading = true;
    });
    try {
      final dietInfoCubit = context.read<DietInfoCubit>();

      dietInfoCubit.postDietInfo(
        activityLevel: selectedActivityLevel,
        dietType: "Keto",
        dietaryGoals: selectedDietGoal,
        macronutrientGoals: {
          "proteins": 0,
          "carbs": 0,
          "fats": 0,
          "calories": 0,
        },
        mealPreferences: selectedMealType,
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
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: const Duration(seconds: 3),
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
              builder: (context) => const MainScreen(),
            ),
          );
        } else if (state is DietInfoFailure) {
          setState(() {
            isLoading = false;
          });
          _showSnackBar('Error: ${state.errMessage}', isError: true);
        }
      },
      child: Column(
        children: [
          DietGoalsSelection(
            onDietGoalSelected: _handleDietGoalSelected,
            selectedDietGoal: selectedDietGoal,
          ),
          ActivityRadioButton(
            onActivityLevelSelected: _handleActivityLevelSelected,
            initialActivityLevel: selectedActivityLevel,
          ),
          TypeOfMealSelection(
            onMealTypeSelected: _handleMealTypeSelected,
            selectedMealType: selectedMealType,
          ),
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
    );
  }
}
