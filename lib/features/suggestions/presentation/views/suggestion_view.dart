import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_suggestion_grid_view.dart';
import 'package:fitfat/features/suggestions/data/suggestions_cubit/suggestions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionView extends StatefulWidget {
  const SuggestionView({super.key, required this.isNoneAllargy});
  final bool isNoneAllargy;

  @override
  State<SuggestionView> createState() => _SuggestionViewState();
}

class _SuggestionViewState extends State<SuggestionView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SuggestionsCubit>().fetchSuggestionsData(
            context,
            isInitialLoad: true,
            useGeneralHealthEndpoint: widget.isNoneAllargy,
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: CustomAppBar(
        title: widget.isNoneAllargy ? 'General Health' : 'Suggestions',
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              CustomTextFiledSearch(),
              CustomSuggestionsGridView(
                gridType: GridType.suggestions,
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
