import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_suggestion_grid_view.dart';
import 'package:flutter/material.dart';

class SuggestionView extends StatelessWidget {
  const SuggestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppLightColor.backgroundColor,
      appBar: CustomAppBar(title: 'Suggestion'),
      body: SingleChildScrollView(
        child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 15, ),
          child: Column(
            children: [
              CustomTextFiledSearch(),
             CustomSuggestionsGridView(isSuggestion: true),
             SizedBox(height: 15)
            ],
          ),
        ),
      ),
      //bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}