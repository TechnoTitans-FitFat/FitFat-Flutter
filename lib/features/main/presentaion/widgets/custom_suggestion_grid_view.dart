import 'package:fitfat/features/main/presentaion/widgets/suggestion_grid_view_item.dart';
import 'package:flutter/material.dart';

class CustomSuggestionGridView extends StatelessWidget {
  const CustomSuggestionGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            mainAxisExtent: 220,
          ),
          itemCount: 6,
          itemBuilder: (context, index) => const SuggestionGridViewItem()),
    );
  }
}
