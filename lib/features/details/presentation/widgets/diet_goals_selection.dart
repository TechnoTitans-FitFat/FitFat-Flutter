import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/details/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DietGoalsSelection extends StatelessWidget {
  const DietGoalsSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What are your dietary goals?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "Weight Loss",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: (){},
            ),
            CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "Weight Gain",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: (){},
            ),
          ],
        ),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "Weight Maintain",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: (){},
            ),
             CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "Muscle Gain",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
               onPressed: (){},
            ),
          ],
        )
      ],
    );
  }
}
