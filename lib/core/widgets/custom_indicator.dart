import 'package:fitfat/core/widgets/custom_circular_percent_indecitor.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({
    super.key,
    required this.value,
    required this.step,
    required this.maxValue,
  });
  final double value;
  final int step;
  final double maxValue;
  @override
  Widget build(BuildContext context) {
    double percentage = (value / maxValue).clamp(0.0, 1.0);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: Colors.transparent,
      ),
      child: CustomCircularPercentIndecitor(
        percentage: percentage,
        step: step,
      ),
    );
  }
}
