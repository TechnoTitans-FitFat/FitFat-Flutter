import 'package:fitfat/features/search/data/models/search_model.dart';
import 'package:fitfat/features/search/presentation/widgets/search_storage.dart';
import 'package:flutter/material.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/search/presentation/widgets/latest_search.dart';
import 'package:fitfat/features/search/presentation/widgets/meal_dishes.dart';
import 'package:fitfat/features/search/presentation/widgets/most_popular_search.dart';


class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  void _onSearch(String query) async {
    final history = await SearchStorage.loadSearchHistory();
    final updatedNames = [...history.name];

    if (!updatedNames.contains(query)) {
      updatedNames.insert(0, query);
      if (updatedNames.length > 10) updatedNames.removeLast();
    }

    final updatedHistory = SearchHistory(name: updatedNames, title: history.title);
    await SearchStorage.saveSearchHistory(updatedHistory);

    // Refresh UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFiledSearch(onSubmitted: _onSearch),
          Text('Latest Search',
              style: AppStyles.textStyle24.copyWith(
                fontSize: 20,
                color: AppLightColor.mainColor,
              )),
          const LatestSearch(), // This will refresh due to setState
          const SizedBox(height: 25),
          Text('Meal Dishes',
              style: AppStyles.textStyle24.copyWith(
                fontSize: 20,
                color: AppLightColor.mainColor,
              )),
          const SizedBox(height: 10),
          const MealDishes(),
          const SizedBox(height: 25),
          Text('Most Popular Search',
              style: AppStyles.textStyle24.copyWith(
                fontSize: 20,
                color: AppLightColor.mainColor,
              )),
          const SizedBox(height: 10),
         MostPopularSearch(onTapItem: _onSearch),

        ],
      ),
    );
  }
}
