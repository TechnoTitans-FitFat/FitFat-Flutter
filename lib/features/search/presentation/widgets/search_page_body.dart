import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/search/presentation/widgets/latest_search.dart';
import 'package:fitfat/features/search/presentation/widgets/meal_dishes.dart';
import 'package:fitfat/features/search/presentation/widgets/most_popular_search.dart';
import 'package:flutter/material.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextFiledSearch(),
          Text('Latest Search',
              style: AppStyles.textStyle24.copyWith(
                fontSize: 20,
                color: AppLightColor.mainColor,
              )),
          const LatestSearch(),
          const SizedBox(
            height: 25,
          ),
          Text('Meal Dishes',
              style: AppStyles.textStyle24.copyWith(
                fontSize: 20,
                color: AppLightColor.mainColor,
              )),
          const SizedBox(
            height: 10,
          ),
          const MealDishes(),
          const SizedBox(
            height: 25,
          ),
          Text('Most Popular Search',
              style: AppStyles.textStyle24.copyWith(
                fontSize: 20,
                color: AppLightColor.mainColor,
              )),
          const SizedBox(
            height: 10,
          ),
          const MostPopularSearch(),
          const SizedBox()
        ],
      ),
    );
  }
}
