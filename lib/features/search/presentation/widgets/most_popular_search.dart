import 'package:fitfat/features/search/presentation/widgets/custom_meal_dishes_item.dart';
import 'package:flutter/material.dart';

class MostPopularSearch extends StatelessWidget {
  final Function(String) onTapItem;

  const MostPopularSearch({super.key, required this.onTapItem});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: [
        GestureDetector(
          onTap: () => onTapItem('Sandwich'),
          child: const CustomMealDishesItem(
              height: 44, width: 122, title: 'Sandwiches'),
        ),
        GestureDetector(
          onTap: () => onTapItem('Soup'),
          child:
              const CustomMealDishesItem(height: 44, width: 66, title: 'Soup'),
        ),
        GestureDetector(
          onTap: () => onTapItem('Meat'),
          child:
              const CustomMealDishesItem(height: 44, width: 66, title: 'Meat'),
        ),
        GestureDetector(
          onTap: () => onTapItem('Salad'),
          child:
              const CustomMealDishesItem(height: 44, width: 69, title: 'Salad'),
        ),
      ],
    );
  }
}
