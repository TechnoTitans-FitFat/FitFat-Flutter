import 'package:fitfat/features/profile/data/model/diet_info.dart';
import 'package:fitfat/features/profile/presentation/widgets/label_with_value_item.dart';
import 'package:flutter/material.dart';

class DietInfoList extends StatelessWidget {
  const DietInfoList({
    super.key,
    required this.dietInfo,
  });

  final DietInfo? dietInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWithValueItem(
          label: 'Diet Type',
          value: dietInfo?.dietType ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Dietary Goals',
          value: dietInfo?.dietaryGoals ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Activity Level',
          value: dietInfo?.activityLevel ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Meal Preferences',
          value: dietInfo?.mealPreferences ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Proteins',
          value: dietInfo != null
              ? '${dietInfo?.macronutrientGoals.proteins} g'
              : 'N/A',
        ),
        LabelWithValueItem(
          label: 'Carbs',
          value: dietInfo != null
              ? '${dietInfo?.macronutrientGoals.carbs} g'
              : 'N/A',
        ),
        LabelWithValueItem(
            label: 'Fats',
            value: dietInfo != null
                ? '${dietInfo?.macronutrientGoals.fats} g'
                : 'N/A'),
        LabelWithValueItem(
            label: 'Calories',
            value: dietInfo != null
                ? '${dietInfo?.macronutrientGoals.calories} kcal'
                : 'N/A')
      ],
    );
  }
}
