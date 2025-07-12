import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LatestSearchItem extends StatelessWidget {
  const LatestSearchItem({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textStyle16.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const Icon(
          Icons.call_received_outlined,
          size: 19,
        )
      ],
    );
  }
}
