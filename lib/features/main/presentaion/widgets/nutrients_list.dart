import 'package:fitfat/features/main/presentaion/widgets/nutrients_list_item.dart';
import 'package:flutter/material.dart';

class NutrientsList extends StatelessWidget {
  const NutrientsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NutrientsListItem(
          img: 'imges/carbohydrate 1.png',
          title1: 'Carb:',
          title2: '75 gm',
        ),
        NutrientsListItem(
          img: 'imges/proteins 1.png',
          title1: 'Pro:',
          title2: '15 gm',
        ),
        NutrientsListItem(
          img: 'imges/vegetable 1.png',
          title1: 'Fiber:',
          title2: '8 gm',
        ),
        NutrientsListItem(
          img: 'imges/trans-fats-free 1.png',
          title1: 'Fat:',
          title2: '5 gm',
        ),
      ],
    );
  }
}
