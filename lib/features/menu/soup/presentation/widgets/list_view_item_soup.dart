import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/presentation/views/details_view.dart';
import 'package:fitfat/features/menu/soup/data/models/soup_model.dart';
import 'package:flutter/material.dart';

class ListViewItemSoup extends StatelessWidget {
  const ListViewItemSoup({super.key, required this.meal});
  final SoupModel meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      color: context.theme.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: context.theme.whiteColor,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
              ),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsView(
                          mealId: meal.id,
                          isMenu: false,
                        ),
                      ),
                    );
                  },
                  child: Image.network(meal.image, fit: BoxFit.cover)),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(meal.name, style: AppStyles.textStyle16),
                  const SizedBox(height: 10),
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
                      '${meal.calories} cal',
                      style: AppStyles.textStyle12.copyWith(
                        color: context.theme.mainColor,
                      ),
                    ),
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
                        meal.rating.toStringAsFixed(1),
                        style: AppStyles.textStyle16.copyWith(
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
                            meal.price.toString(),
                            style: AppStyles.textStyle16.copyWith(
                              color: context.theme.mainColor,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text('EGP', style: AppStyles.textStyle16),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
