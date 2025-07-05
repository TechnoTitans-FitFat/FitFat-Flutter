import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class IncreaseAndDecreseCount extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const IncreaseAndDecreseCount({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.mainColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onDecrement,
              child: Icon(
                Icons.remove,
                color: context.theme.whiteColor,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: context.theme.whiteColor,
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: AppStyles.textStyle18,
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: onIncrement,
              child: Icon(
                Icons.add,
                color: context.theme.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
