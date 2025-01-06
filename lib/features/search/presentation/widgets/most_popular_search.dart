import 'package:fitfat/features/search/presentation/widgets/custom_meal_dishes_item.dart';
import 'package:flutter/material.dart';

class MostPopularSearch extends StatelessWidget {
  const MostPopularSearch({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
             CustomMealDishesItem(height: 44, width: 99, title: 'Chickens'),
             SizedBox(width:12,),
             CustomMealDishesItem(height: 44, width: 122, title: 'Sandwiches'),
             SizedBox(width:12,),
             CustomMealDishesItem(height: 44, width: 77, title: 'Drinks'),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            CustomMealDishesItem(height:44, width: 100, title: 'Desserts'),
             SizedBox(width:12,),
             CustomMealDishesItem(height: 44, width: 66, title: 'Soup'),
             SizedBox(width:12,),
              CustomMealDishesItem(height: 44, width: 66, title: 'Meat'),
             SizedBox(width:12,),
             CustomMealDishesItem(height: 44, width: 69, title: 'Salad'),
          ]
        )
      ],
    );
  }
}