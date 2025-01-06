import 'package:fitfat/features/search/presentation/widgets/custom_meal_dishes_item.dart';
import 'package:flutter/material.dart';

class MealDishes extends StatelessWidget {
  const MealDishes({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
      CustomMealDishesItem(height: 44, width: 110, title: 'Breakfast'),
      SizedBox(width: 12,),
      CustomMealDishesItem(height: 44, width: 84, title: 'Lunch'),
      SizedBox(width: 12,),
      CustomMealDishesItem(height: 44, width: 88, title: 'Dinner'),
      ],
    );
  }
}
