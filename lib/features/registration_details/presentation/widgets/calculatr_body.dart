import 'package:fitfat/features/registration_details/presentation/widgets/activity_radio_button.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/diet_goals_selection.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/type_of_meal_selection.dart';
import 'package:flutter/material.dart';

class CalculatrBody extends StatefulWidget {
  const CalculatrBody({super.key});

  @override
  State<CalculatrBody> createState() => _CalculatrBodyState();
}

class _CalculatrBodyState extends State<CalculatrBody> {
  String selectedActivityLevel = 'Sedentary';
  String selectedMealType = '';
  String selectedDietGoal = '';

  void _handleActivityLevelSelected(String level) {
    setState(() {
      selectedActivityLevel = level;
    });
    // Here you can add logic to save the selection or trigger other actions
    print('Selected activity level: $level');
  }

  void _handleMealTypeSelected(String mealType) {
    setState(() {
      selectedMealType = mealType;
    });
    // Here you can add logic to save the selection or trigger other actions
    print('Selected meal type: $mealType');
  }

  void _handleDietGoalSelected(String dietGoal) {
    setState(() {
      selectedDietGoal = dietGoal;
    });
    // Here you can add logic to save the selection or trigger other actions
    print('Selected diet goal: $dietGoal');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
