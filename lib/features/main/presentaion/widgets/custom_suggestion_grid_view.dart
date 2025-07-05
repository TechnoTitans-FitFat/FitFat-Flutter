import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/main/data/models/main_screen_model.dart';
import 'package:fitfat/features/menu/data/cart_cubit/cart_cubit.dart';
import 'package:fitfat/features/menu/data/menu_cubit/menu_cubit.dart';
import 'package:fitfat/features/menu/data/models/menu_model.dart';
import 'package:fitfat/features/suggestions/data/models/suggestions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/main/presentaion/widgets/suggestion_grid_view_item.dart';
import 'package:fitfat/features/main/data/main_screen_cubit/main_screen_cubit.dart';
import 'package:fitfat/features/suggestions/data/suggestions_cubit/suggestions_cubit.dart';

enum GridType { mainScreen, suggestions, menu }

class CustomSuggestionsGridView extends StatefulWidget {
  final GridType gridType;

  const CustomSuggestionsGridView({super.key, required this.gridType});

  @override
  State<CustomSuggestionsGridView> createState() =>
      _CustomSuggestionsGridViewState();
}

class _CustomSuggestionsGridViewState extends State<CustomSuggestionsGridView> {
  @override
  Widget build(BuildContext context) {
    switch (widget.gridType) {
      case GridType.suggestions:
        return BlocBuilder<SuggestionsCubit, SuggestionsState>(
          builder: (context, state) => _buildSuggestionsGrid(context, state),
        );
      case GridType.mainScreen:
        return BlocBuilder<MainScreenCubit, MainScreenState>(
          builder: (context, state) => _buildMainScreenGrid(context, state),
        );
      case GridType.menu:
        return BlocBuilder<MenuCubit, MenuState>(
          builder: (context, state) => _buildMenuGrid(context, state),
        );
      default:
        return const SizedBox();
    }
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
                  child: Text("Previous",
                      style: TextStyle(color: context.theme.mainColor)),
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
                child: Text("Next",
                    style: TextStyle(color: context.theme.mainColor)),
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

  Widget _buildMenuGrid(BuildContext context, MenuState state) {
    if (state is MenuLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MenuSucess) {
      final List<MenuModel> data = state.data;
      return _buildGridView(data);
    } else if (state is MenuFailure) {
      return Center(child: Text("Error: ${state.errMessage}"));
    }
    return const SizedBox();
  }

  Widget _buildGridView(List<dynamic> data) {
    return BlocConsumer<CartCubit, CartState>(listener: (context, state) {
      if (state is CartSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    }, builder: (context, state) {
      return GridView.builder(
        padding: EdgeInsets.zero,
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
    });
  }
}
