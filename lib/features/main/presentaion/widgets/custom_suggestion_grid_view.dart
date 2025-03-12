import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/main/data/models/main_screen_model.dart';
import 'package:fitfat/features/suggestions/data/models/suggestions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/main/presentaion/widgets/suggestion_grid_view_item.dart';
import 'package:fitfat/features/main/data/main_screen_cubit/main_screen_cubit.dart';
import 'package:fitfat/features/suggestions/data/suggestions_cubit/suggestions_cubit.dart';

class CustomSuggestionsGridView extends StatefulWidget {
  final bool isSuggestion;

  const CustomSuggestionsGridView({super.key, required this.isSuggestion});

  @override
  State<CustomSuggestionsGridView> createState() =>
      _CustomSuggestionsGridViewState();
}

class _CustomSuggestionsGridViewState extends State<CustomSuggestionsGridView> {
  @override
  Widget build(BuildContext context) {
    return widget.isSuggestion
        ? BlocBuilder<SuggestionsCubit, SuggestionsState>(
            builder: (context, state) => _buildSuggestionsGrid(context, state),
          )
        : BlocBuilder<MainScreenCubit, MainScreenState>(
            builder: (context, state) => _buildMainScreenGrid(context, state),
          );
  }

  Widget _buildSuggestionsGrid(BuildContext context, SuggestionsState state) {
    if (state is SuggestionsLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SuggestionsSuccess) {
      // ignore: unused_local_variable
      final List<SuggestionsModel> data = state.data;
      final suggestionsCubit = BlocProvider.of<SuggestionsCubit>(context);
      final List<SuggestionsModel> currentPageData =
          suggestionsCubit.paginatedData[suggestionsCubit.currentPageIndex];

      return Column(
        children: [
          _buildGridView(currentPageData),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (suggestionsCubit.currentPageIndex > 0)
                ElevatedButton(
                  onPressed: () {
                    suggestionsCubit.prevPage();
                  },
                  child: const Text("Previous",
                      style: TextStyle(color: AppLightColor.mainColor)),
                ),
              ElevatedButton(
                onPressed: () {
                  if (suggestionsCubit.currentPageIndex <
                      suggestionsCubit.paginatedData.length - 1) {
                    suggestionsCubit.nextPage();
                  } else {
                    setState(() {
                      suggestionsCubit.fetchSuggestionsData();
                    });
                  }
                },
                child: const Text("Next",
                    style: TextStyle(color: AppLightColor.mainColor)),
              ),
            ],
          ),
        ],
      );
    } else if (state is SuggestionsFailure) {
      return Center(child: Text("Error: ${state.errMessage}"));
    }
    return const SizedBox();
  }

  Widget _buildMainScreenGrid(BuildContext context, MainScreenState state) {
    if (state is MainScreenLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MainScreenSucess) {
      final List<MainScreenModel> data = state.data;
      return _buildGridView(data);
    } else if (state is MainScreenFailure) {
      return Center(child: Text("Error: ${state.errMessage}"));
    }
    return const SizedBox();
  }

  Widget _buildGridView(List<dynamic> data) {
    return GridView.builder(
      key: ValueKey(data.length),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        mainAxisExtent: 220,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return SuggestionGridViewItem(
          imageUrl: item.image,
          title: item.name,
          calories: item.calories,
          price: item.price,
          id: item.id,
        );
      },
    );
  }
}
