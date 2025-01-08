import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/details/presentation/views/calculate_diet_view.dart';
import 'package:fitfat/features/details/presentation/views/input_my_diet_view.dart';
import 'package:fitfat/features/details/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DietDeterminationWaySelection extends StatelessWidget {
  const DietDeterminationWaySelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "How would you like to determine your diet information?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "Input My Diet",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>  const InputMyDietView()));
              },
            ),
            CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "CalCulate it For Me",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CalculateDietView();
                  },
                ));
              },
            ),
          ],
        )
      ],
    );
  }
}
