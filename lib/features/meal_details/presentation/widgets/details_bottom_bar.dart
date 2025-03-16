import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DetailsBottomBar extends StatelessWidget {
  const DetailsBottomBar({
    super.key,
    required this.price,
  });
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xffF5F5F5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppLightColor.mainColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.remove,
                        color: AppLightColor.whiteColor,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppLightColor.whiteColor,
                        ),
                        child: Center(
                          child: Text(
                            '1',
                            style: AppStyles.textStyle18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.add,
                        color: AppLightColor.whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    price.toString(),
                    style: AppStyles.textStyle24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'EGB',
                    style: AppStyles.textStyle24
                        .copyWith(color: AppLightColor.mainColor),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 45,
            width: 162,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppLightColor.mainColor,
            ),
            child: Center(
              child: Text(
                'Add To Cart',
                style: AppStyles.textStyle16
                    .copyWith(color: AppLightColor.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
