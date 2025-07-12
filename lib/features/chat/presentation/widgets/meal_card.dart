import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/chat/data/models/chat_bot_model.dart';
import 'package:fitfat/features/meal_details/presentation/views/details_view.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});
  final ChatBotModel meal;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsView(
                    mealId: meal.id,
                    isMenu: true,
                  ),
                ),
              );
            },
            child: Image.network(
              meal.image,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //title,
                meal.name,
                style: AppStyles.textStyle16.copyWith(
                  color: context.theme.blackColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Row(
                spacing: 5,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.mainColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      (meal.allergy ?? []).join(', '),
                      style: AppStyles.textStyle12.copyWith(
                        color: context.theme.mainColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.mainColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      //'$calories cal',
                      '${meal.calories} cal',
                      style: AppStyles.textStyle12.copyWith(
                        color: context.theme.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffFDE424),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    //rating.toStringAsFixed(1),
                    meal.rating.toStringAsFixed(1),
                    style: AppStyles.textStyle16.copyWith(
                      color: context.theme.blackColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        //price.toString(),
                        meal.price.toString(),
                        style: AppStyles.textStyle16.copyWith(
                          color: context.theme.mainColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'EGP',
                        style: AppStyles.textStyle16.copyWith(
                          color: context.theme.blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
