import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/presentation/views/details_view.dart';
import 'package:flutter/material.dart';

class CategoriesListViewItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String? type;
  final double calories;
  final double rating;
  final double price;
  final bool showType;
  final String id;

  const CategoriesListViewItem({
    super.key,
    required this.title,
    required this.imagePath,
    this.type,
    required this.calories,
    required this.rating,
    required this.price,
    this.showType = true,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black,
      color: context.theme.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsView(mealId: id)));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.textStyle16.copyWith(
                      color: context.theme.blackColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      if (showType)
                        Visibility(
                          visible: type != "Diabetes" && type != null,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: context.theme.mainColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              type ?? '',
                              style: AppStyles.textStyle12.copyWith(
                                color: context.theme.mainColor,
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(width: 5),
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
                          '$calories cal',
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
                        rating.toStringAsFixed(1),
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
                            price.toString(),
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
                      /*  GestureDetector(
                        onTap: onFavouriteTap,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Image.asset( 
                              isFavourite ? Assets.icons.liked.path  :  Assets.icons.add.path
                              ),

                        ),
                        ),*/
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
