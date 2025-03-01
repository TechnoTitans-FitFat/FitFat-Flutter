import 'package:fitfat/features/meal_details/data/models/meal_details_model.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/nutrients_list_item.dart';
import 'package:flutter/material.dart';

class NutrientsList extends StatelessWidget {
  const NutrientsList({
    super.key, required this.meal,
  });
  final MealDetailsModel meal;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        NutrientsListItem(
          img: 'imges/carbohydrate 1.png',
          title1: 'Carb:',
          title2: meal.carb ,
        ),
        NutrientsListItem(
          img: 'imges/proteins 1.png',
          title1: 'Pro:',
          title2: meal.protein,
        ),
        NutrientsListItem(
          img: 'imges/vegetable 1.png',
          title1: 'Fiber:',
          title2: meal.fiber,
        ),
        NutrientsListItem(
          img: 'imges/trans-fats-free 1.png',
          title1: 'Fat:',
          title2: meal.fat,
        ),
      ],
    );
  }
}
