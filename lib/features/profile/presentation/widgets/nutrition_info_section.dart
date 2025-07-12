import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/profile/presentation/views/custom_dropdown.dart';
import 'package:fitfat/features/profile/presentation/views/custom_text_field.dart';
import 'package:flutter/material.dart';

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
      context,
      'Nutrition Information',
      [
        CustomDropdown(
          label: 'Diet Type',
          value: selectedDietType,
          items: const ['High-Carb', 'Low-Carb', 'Keto', 'Vegan'],
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
          items: const [
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
          items: const [
            'Sedentary',
            'Lightly Active',
            'Moderately Active ',
            'Very Active'
          ],
          onChanged: onActivityLevelChanged,
        ),
        const SizedBox(height: 16),
        CustomDropdown(
          label: 'Meal Preferences',
          value: selectedMealPreference,
          items: const [
            'Vegetarian',
            "Gluten-Free",
            'Vegan',
            "Keto",
          ],
          onChanged: onMealPreferenceChanged,
        ),
      ],
    );
  }

  Widget _buildSection(
      BuildContext context, String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.theme.whiteColor,
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
            ),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}
