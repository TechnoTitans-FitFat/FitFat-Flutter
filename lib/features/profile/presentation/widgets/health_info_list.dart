import 'package:fitfat/features/profile/data/model/health_info.dart';
import 'package:fitfat/features/profile/presentation/widgets/label_with_value_item.dart';
import 'package:flutter/material.dart';

class HealthInfoList extends StatelessWidget {
  const HealthInfoList({
    super.key,
    required this.healthInfo,
  });

  final HealthInfo? healthInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWithValueItem(
          label: 'Allergies',
          value: healthInfo?.foodAllergies ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Type of Diabetes',
          value: healthInfo?.diabetesType ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Insulin-to-Carb Ratio',
          value: healthInfo?.insulinToCardRatio.toString() ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Correction Factor',
          value: healthInfo != null ? '${healthInfo?.correctionFactor}' : 'N/A',
        ),
      ],
    );
  }
}
