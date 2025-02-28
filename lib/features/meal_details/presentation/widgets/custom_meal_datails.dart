import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomMealDatails extends StatelessWidget {
  const CustomMealDatails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Rustic Duck ',
              style: AppStyles.textStyle24,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rate,
                  color: Colors.yellow,
                ),
                Text(
                  '4.2',
                  style: AppStyles.textStyle16,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.local_fire_department,
                  color: Colors.orange,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '350 cal',
                  style: AppStyles.textStyle16,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.schedule,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '25 min',
                  style: AppStyles.textStyle16,
                )
              ],
            )
          ],
        ),
        Image.asset(
          'imges/Component 5.png',
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        )
      ],
    );
  }
}
