import 'package:fitfat/features/search/presentation/widgets/custom_meal_dishes_item.dart';
import 'package:flutter/material.dart';

class MostPopularSearch extends StatelessWidget {
  final Function(String) onTapItem;

  const MostPopularSearch({super.key, required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => onTapItem('Chickens'),
              child: const CustomMealDishesItem(height: 44, width: 99, title: 'Chickens'),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => onTapItem('Sandwiches'),
              child: const CustomMealDishesItem(height: 44, width: 122, title: 'Sandwiches'),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => onTapItem('Drinks'),
              child: const CustomMealDishesItem(height: 44, width: 77, title: 'Drinks'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: () => onTapItem('Desserts'),
              child: const CustomMealDishesItem(height: 44, width: 100, title: 'Desserts'),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => onTapItem('Soup'),
              child: const CustomMealDishesItem(height: 44, width: 66, title: 'Soup'),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => onTapItem('Meat'),
              child: const CustomMealDishesItem(height: 44, width: 66, title: 'Meat'),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => onTapItem('Salad'),
              child: const CustomMealDishesItem(height: 44, width: 69, title: 'Salad'),
            ),
          ],
        )
      ],
    );
  }
}
