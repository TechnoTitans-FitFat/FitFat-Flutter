import 'package:fitfat/features/main/presentaion/allergy_category/views/allergy_view.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/views/diabetes_view.dart';
import 'package:fitfat/features/main/presentaion/diet_category/views/diet_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_card_category.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DietView(),
              ),
            );
          },
          child: const CustomCardCategory(
            icon: Icons.food_bank,
            text: 'Diet',
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DiabetesView(),
              ),
            );
          },
          child: const CustomCardCategory(
            text: 'Diabetes',
            icon: Icons.food_bank,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllergyView(),
              ),
            );
          },
          child: const CustomCardCategory(
            text: 'Allergy',
            icon: Icons.food_bank,
          ),
        ),
      ],
    );
  }
}
