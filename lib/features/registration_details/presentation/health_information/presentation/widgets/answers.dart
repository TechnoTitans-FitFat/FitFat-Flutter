import 'package:fitfat/features/registration_details/presentation/health_information/presentation/widgets/custom_card_answer.dart';
import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({
    super.key,
    required this.anyFoodAllergies,
    required this.onFoodAllergyChanged,
  });

  final List<String> anyFoodAllergies;
  final Function(String, bool) onFoodAllergyChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Row(
          children: [
            CustomCardAnswer(
              title: 'Lactose',
              isSelected: anyFoodAllergies.contains('Lactose'),
              onTap: () => onFoodAllergyChanged(
                  'Lactose', !anyFoodAllergies.contains('Lactose')),
            ),
            const SizedBox(width: 25),
            CustomCardAnswer(
              title: 'Peanuts',
              isSelected: anyFoodAllergies.contains('Peanuts'),
              onTap: () => onFoodAllergyChanged(
                  'Peanuts', !anyFoodAllergies.contains('Peanuts')),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            CustomCardAnswer(
              title: 'Shellfish',
              isSelected: anyFoodAllergies.contains('Shellfish'),
              onTap: () => onFoodAllergyChanged(
                  'Shellfish', !anyFoodAllergies.contains('Shellfish')),
            ),
            const SizedBox(width: 25),
            CustomCardAnswer(
              title: 'Wheat',
              isSelected: anyFoodAllergies.contains('Wheat'),
              onTap: () => onFoodAllergyChanged(
                  'Wheat', !anyFoodAllergies.contains('Wheat')),
            ),
          ],
        ),
        const SizedBox(height: 7),
        CustomCardAnswer(
          title: 'None',
          isSelected: anyFoodAllergies.contains('None'),
          onTap: () =>
              onFoodAllergyChanged('None', !anyFoodAllergies.contains('None')),
        ),
      ],
    );
  }
}
