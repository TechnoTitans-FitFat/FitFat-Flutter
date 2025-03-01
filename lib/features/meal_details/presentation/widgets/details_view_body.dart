import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/data/models/meal_details_model.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/custom_meal_datails.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/nutrients_list.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
    required this.meal,
  });

  final MealDetailsModel meal;

  @override
  Widget build(BuildContext context) {
    // final item = data
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: AppLightColor.secondColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ClipOval(
                  child: Image.network(
                    meal.image,
                    height: 190,
                    width: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45))),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomMealDatails(
                    title: meal.name,
                    caloreis: '${meal.calories} cal',
                    cookingTime: meal.cookingTime,
                    rating: meal.rating,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      'Nutrients',
                      style: AppStyles.textStyle24.copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 18),
                  NutrientsList(
                    meal: meal,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text('Ingredients',
                        style: AppStyles.textStyle24.copyWith(fontSize: 20)),
                  ),
                  const SizedBox(height: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: meal.ingredients
                        .map((ingredient) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "• ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Expanded(
                                  child: Text(
                                    ingredient,
                                    style: AppStyles.textStyle16,
                                  ),
                                ),
                              ],
                            ))
                        .toList(), // toList() should be here
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
