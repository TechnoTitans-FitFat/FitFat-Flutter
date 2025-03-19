import 'package:fitfat/core/constants/light_colors.dart';

import 'package:fitfat/features/registration_details/presentation/widgets/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputMyDietViewBody extends StatefulWidget {
  const InputMyDietViewBody({super.key});

  @override
  State<InputMyDietViewBody> createState() => _InputMyDietViewBodyState();
}

class _InputMyDietViewBodyState extends State<InputMyDietViewBody> {
  // Diet preferences state
  final List<String> _dietTypes = [
    'Balanced',
    'Low Carb',
    'Keto',
    'Vegetarian',
    'Vegan',
    'Paleo'
  ];
  String _selectedDietType = 'Balanced';

  // Macronutrient values
  double _proteinPercentage = 30;
  double _carbsPercentage = 40;
  double _fatPercentage = 30;

  // Meal frequency
  final double _mealsPerDay = 3;

  // Calorie goal
  final double _calorieGoal = 2000;

  // Food preferences
  final List<String> _foodPreferences = [];
  final List<String> _availableFoods = [
    'Chicken',
    'Beef',
    'Fish',
    'Eggs',
    'Dairy',
    'Fruits',
    'Vegetables',
    'Nuts',
    'Grains',
    'Legumes'
  ];

  void _saveDietInformation() {
    // Here you would save the diet information to your state management solution
    // For example, using a provider, bloc, or passing to the next page

    // Example of data to save
    final Map<String, dynamic> dietInfo = {
      'dietType': _selectedDietType,
      'proteinPercentage': _proteinPercentage,
      'carbsPercentage': _carbsPercentage,
      'fatPercentage': _fatPercentage,
      'mealsPerDay': _mealsPerDay.toInt(),
      'calorieGoal': _calorieGoal.toInt(),
      'foodPreferences': _foodPreferences,
    };

    // Print for debugging
    print('Diet information saved: $dietInfo');

    // Navigate to the next page (journey start)
    Navigator.of(context).pushNamed('/journey_start');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Diet Type",
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _dietTypes.map((diet) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDietType = diet;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _selectedDietType == diet
                        ? AppLightColor.mainColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppLightColor.mainColor,
                    ),
                  ),
                  child: Text(
                    diet,
                    style: TextStyle(
                      color: _selectedDietType == diet
                          ? Colors.white
                          : AppLightColor.mainColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Macronutrient sliders - ensure they always sum to 100%
          Text(
            "Macronutrient Distribution",
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(height: 12),
          CustomSlider(
            label: "Protein",
            value: _proteinPercentage,
            min: 10,
            max: 60,
            onChanged: (value) {
              setState(() {
                _proteinPercentage = value;
                // Adjust carbs and fat to maintain 100% total
                double remaining = 100 - _proteinPercentage;
                double ratio =
                    _carbsPercentage / (_carbsPercentage + _fatPercentage);
                _carbsPercentage = remaining * ratio;
                _fatPercentage = remaining * (1 - ratio);
              });
            },
          ),
          CustomSlider(
            label: "Carbs",
            value: _carbsPercentage,
            min: 10,
            max: 70,
            onChanged: (value) {
              setState(() {
                _carbsPercentage = value;
                // Adjust protein and fat to maintain 100% total
                double remaining = 100 - _carbsPercentage;
                double ratio =
                    _proteinPercentage / (_proteinPercentage + _fatPercentage);
                _proteinPercentage = remaining * ratio;
                _fatPercentage = remaining * (1 - ratio);
              });
            },
          ),
          CustomSlider(
            label: "Fat",
            value: _fatPercentage,
            min: 10,
            max: 60,
            onChanged: (value) {
              setState(() {
                _fatPercentage = value;
                // Adjust protein and carbs to maintain 100% total
                double remaining = 100 - _fatPercentage;
                double ratio = _proteinPercentage /
                    (_proteinPercentage + _carbsPercentage);
                _proteinPercentage = remaining * ratio;
                _carbsPercentage = remaining * (1 - ratio);
              });
            },
          ),
          CustomSlider(
            label: "Calories",
            value: _fatPercentage,
            min: 10,
            max: 60,
            onChanged: (value) {
              setState(() {
                _fatPercentage = value;
                // Adjust protein and carbs to maintain 100% total
                double remaining = 100 - _fatPercentage;
                double ratio = _proteinPercentage /
                    (_proteinPercentage + _carbsPercentage);
                _proteinPercentage = remaining * ratio;
                _carbsPercentage = remaining * (1 - ratio);
              });
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
