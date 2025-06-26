import 'package:fitfat/features/profile/data/model/health_info.dart';
import 'package:fitfat/features/profile/presentation/widgets/label_with_value_item.dart';
import 'package:flutter/material.dart';

class GeneralInfoList extends StatelessWidget {
  const GeneralInfoList({
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
          label: 'Gender',
          value: healthInfo?.gender ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Date of Birth',
          value: healthInfo?.dateOfBirth.toString().split(' ')[0] ?? 'N/A',
        ),
        LabelWithValueItem(
          label: 'Height',
          value: healthInfo != null ? '${healthInfo?.height} cm' : 'N/A',
        ),
        LabelWithValueItem(
          label: 'Weight',
          value: healthInfo != null ? '${healthInfo?.weight} kg' : 'N/A',
        ),
      ],
    );
  }
}
