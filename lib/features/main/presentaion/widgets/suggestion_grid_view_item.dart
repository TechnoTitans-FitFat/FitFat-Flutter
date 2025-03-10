import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/presentation/views/details_view.dart';
import 'package:flutter/material.dart';

class SuggestionGridViewItem extends StatelessWidget {
  const SuggestionGridViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.calories,
    required this.id,
  });

  final String imageUrl;
  final String title;
  final double price;
  final String calories;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppLightColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppLightColor.blackColor.withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsView(mealId: id, )));
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppLightColor.blackColor.withOpacity(0.25),
                      blurRadius: 3,
                      offset: const Offset(4, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppStyles.textStyle16
                  .copyWith(color: AppLightColor.blackColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppLightColor.mainColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text('$calories cal',
                      style: AppStyles.textStyle12
                          .copyWith(color: AppLightColor.mainColor)),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(price.toString(),
                    style: AppStyles.textStyle16
                        .copyWith(color: AppLightColor.mainColor)),
                Text(" EGP",
                    style: AppStyles.textStyle16
                        .copyWith(color: AppLightColor.blackColor)),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: AppLightColor.mainColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.add,
                      color: AppLightColor.whiteColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
