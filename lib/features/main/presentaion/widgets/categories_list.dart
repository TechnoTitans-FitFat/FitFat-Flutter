
import 'package:fitfat/features/main/presentaion/allergy_category/presentation/views/allergy_view.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/presentation/views/diabetes_view.dart';
import 'package:fitfat/features/main/presentaion/diet_category/presentation/views/diet_view.dart';
import 'package:fitfat/core/widgets/custom_card_category.dart';
import 'package:fitfat/gen/assets.gen.dart';
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
            child: CustomCardCategory(
               text: 'Diet',
                img: Assets.icons.dietSvg,
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
            child: CustomCardCategory(
              text: 'Diabetes',
              img: Assets.icons.diabets,
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
            child: CustomCardCategory(
              text: 'Allergy',
               img: Assets.icons.allergySvg,
            ),
          ),
        ),
      ],
    );
  }
}
