import 'package:fitfat/features/main/presentaion/widgets/custom_card_category.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomCardCategory(
          icon: Icons.food_bank,
          text: 'Diet',
        ),
        CustomCardCategory(
          text: 'Diadetes',
          icon: Icons.food_bank,
        ),
        CustomCardCategory(
          text: 'Allergy',
          icon: Icons.food_bank,
        ),
      ],
    );
  }
}
