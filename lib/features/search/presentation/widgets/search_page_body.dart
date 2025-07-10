import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/search/data/search_cubit/search_cubit.dart';
import 'package:fitfat/features/search/data/search_history/search_history_cubit.dart';
import 'package:fitfat/features/search/presentation/widgets/search_result_item.dart';
import 'package:fitfat/features/search/presentation/widgets/search_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/search/presentation/widgets/latest_search.dart';
import 'package:fitfat/features/search/presentation/widgets/meal_dishes.dart';
import 'package:fitfat/features/search/presentation/widgets/most_popular_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  bool hasSearched = false;

 @override
  void initState() {
     super.initState();

  final token = context.read<LoginCubit>().user?.token;

  if (token != null) {
    context.read<SearchHistoryCubit>().getLatestSearches(context);
  }
  }
  
 void _onSearch(String query) {
  if (query.trim().isEmpty) return;
  print("Searching for: $query"); 
  setState(() {
    hasSearched = true;
  });
  context.read<SearchCubit>().searchRecipes(query);
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextFiled(onSubmitted: _onSearch),
          const SizedBox(height: 20),

          
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (!hasSearched) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Latest Search', style: AppStyles.textStyle24.copyWith(fontSize: 20, color: context.theme.mainColor)),
                        LatestSearch(),
                        const SizedBox(height: 25),
                        Text('Meal Dishes', style: AppStyles.textStyle24.copyWith(fontSize: 20, color: context.theme.mainColor)),
                        const SizedBox(height: 10),
                        const MealDishes(),
                        const SizedBox(height: 25),
                        Text('Most Popular Search', style: AppStyles.textStyle24.copyWith(fontSize: 20, color: context.theme.mainColor)),
                        const SizedBox(height: 10),
                        MostPopularSearch(onTapItem: _onSearch),
                      ],
                    ),
                  );
                }

                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchSuccess) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.results.length,
                    itemBuilder: (context, index) {
                      final recipe = state.results[index];
                       return Padding(
                         padding: const EdgeInsets.only(bottom: 12),
                         child: SearchResultItem(recipe: recipe),
                       );
                    },
                  );
                } else if (state is SearchFailure) {
                  return Center(child: Text(state.errMessage));
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
