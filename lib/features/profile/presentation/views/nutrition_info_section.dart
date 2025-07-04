import 'package:flutter/material.dart';
import 'custom_dropdown.dart';
import 'custom_text_field.dart';

class NutritionInfoSection extends StatelessWidget {
  final String selectedDietType;
  final String selectedDietaryGoal;
  final String selectedActivityLevel;
  final String selectedMealPreference;
  final TextEditingController proteinsController;
  final TextEditingController carbsController;
  final TextEditingController fatsController;
  final TextEditingController caloriesController;
  final ValueChanged<String> onDietTypeChanged;
  final ValueChanged<String> onDietaryGoalChanged;
  final ValueChanged<String> onActivityLevelChanged;
  final ValueChanged<String> onMealPreferenceChanged;

  const NutritionInfoSection({
    Key? key,
    required this.selectedDietType,
    required this.selectedDietaryGoal,
    required this.selectedActivityLevel,
    required this.selectedMealPreference,
    required this.proteinsController,
    required this.carbsController,
    required this.fatsController,
    required this.caloriesController,
    required this.onDietTypeChanged,
    required this.onDietaryGoalChanged,
    required this.onActivityLevelChanged,
    required this.onMealPreferenceChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildSection(
      'Nutrition Information',
      [
        CustomDropdown(
          label: 'Diet Type',
          value: selectedDietType,
          items: [
            'Keto',
            'Vegan',
            'High-Carb',
            'Low Carb',
          ],
          onChanged: onDietTypeChanged,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Macronutrient Goals',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Proteins',
                    controller: proteinsController,
                    unit: 'g',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextField(
                    label: 'Carbs',
                    controller: carbsController,
                    unit: 'g',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'Fats',
                    controller: fatsController,
                    unit: 'g',
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomTextField(
                    label: 'Calories',
                    controller: caloriesController,
                    unit: 'kcal',
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          label: 'Dietary Goals',
          value: selectedDietaryGoal,
          items: [
            'Weight Loss',
            'Weight Gain',
            'Weight Maintain',
            'Muscle Gain'
          ],
          onChanged: onDietaryGoalChanged,
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          label: 'Activity Level',
          value: selectedActivityLevel,
          items: [
            'Sedentary',
            'Lightly Active',
            'Moderately Active',
            'Very Active',
          ],
          onChanged: onActivityLevelChanged,
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          label: 'Meal Preferences',
          value: selectedMealPreference,
          items: [
            'Vegetarian',
            'Vegan',
            'Gluten-Free',
            'Keto',
          ],
          onChanged: onMealPreferenceChanged,
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
