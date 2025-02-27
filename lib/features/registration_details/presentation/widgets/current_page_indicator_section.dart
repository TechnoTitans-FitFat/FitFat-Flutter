import 'package:fitfat/core/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';

import 'current_page_and_next_page_profile_set_up.dart';

class CurrentPageIndicatorSection extends StatelessWidget {
  const CurrentPageIndicatorSection({
    super.key,
    required this.currentPageTitle,
    required this.nextPageTitle,
    required this.value,
    required this.step,
  });
  final String currentPageTitle;
  final String nextPageTitle;
  final double value;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: [
          CustomIndicator(value: value, step: step, maxValue: 3),
          CurrentPageAndNextPageProfileSetUp(
            currentPageTitle: currentPageTitle,
            nextPageTitle: nextPageTitle,
          ),
        ],
      ),
    );
  }
}
