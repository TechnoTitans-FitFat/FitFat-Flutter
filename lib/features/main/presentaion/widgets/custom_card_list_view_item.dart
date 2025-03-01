import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomCardListViewItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String? type;
  final String calories;
  final int price;
  final bool showType;
  final bool isFavourite;

  const CustomCardListViewItem({
    super.key,
    required this.title,
    required this.imagePath,
    this.type,
    required this.calories,
    required this.price,
    this.showType = true,
    required this.isFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      shadowColor: Colors.black,
      color: AppLightColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppLightColor.blackColor.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppStyles.textStyle16.copyWith(
                      color: AppLightColor.blackColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      if (showType)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppLightColor.mainColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            type ?? '',
                            style: AppStyles.textStyle12.copyWith(
                              color: AppLightColor.mainColor,
                            ),
                          ),
                        ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal:15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppLightColor.mainColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          '$calories cal',
                          style: AppStyles.textStyle12.copyWith(
                            color: AppLightColor.mainColor,
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
                        '4.5',
                        style: AppStyles.textStyle16.copyWith(
                          color: AppLightColor.blackColor,
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
                              color: AppLightColor.mainColor,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'EGP',
                            style: AppStyles.textStyle16.copyWith(
                              color: AppLightColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppLightColor.mainColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                             isFavourite ? Icons.favorite : Icons.add,
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
          ],
        ),
      ),
    );
  }
}
