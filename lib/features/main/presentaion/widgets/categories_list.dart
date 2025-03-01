import 'package:fitfat/features/main/presentaion/allergy_category/views/allergy_view.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/views/diabetes_view.dart';
import 'package:fitfat/features/main/presentaion/diet_category/views/diet_view.dart';
import 'package:fitfat/core/widgets/custom_card_category.dart';
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
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DietView(),
                ),
              );
            },
            child: const CustomCardCategory(
               text: 'Diet',
                img: 'assets/icons/diet.svg',
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
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
              img: 'assets/icons/diabets.svg',
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
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
               img: 'assets/icons/allergy.svg',
            ),
          ),
        ),
      ],
    );
  }
}
