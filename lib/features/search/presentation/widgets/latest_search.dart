import 'package:fitfat/features/search/presentation/widgets/latest_search_item.dart';
import 'package:flutter/material.dart';

class LatestSearch extends StatelessWidget {
  
  const LatestSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LatestSearchItem(title: 'tuna'),
         LatestSearchItem(title: 'tuna'),
          LatestSearchItem(title: 'tuna'),
      ],
    );
}
}