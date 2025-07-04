import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_suggestion_grid_view.dart';
import 'package:flutter/material.dart';

class SuggestionView extends StatelessWidget {
  const SuggestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar:const CustomAppBar(title: 'Suggestion'),
      body:const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              CustomTextFiledSearch(),
              CustomSuggestionsGridView(
                gridType: GridType.suggestions,
              )
            ],
          ),
        ),
      ),
      //bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
