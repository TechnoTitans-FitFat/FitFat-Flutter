import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/details/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TypeOfMealSelection extends StatelessWidget {
  const TypeOfMealSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What type of meal do you prefer?",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "Vegetarian",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: (){},
            ),
            CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "Gluten-Free",
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
              widget: "Vegan",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: (){},
            ),
            CustomButton(
              borderColor: AppLightColor.mainColor,
              widget: "Keto",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: (){},
            ),
          ],
        )
      ],
      ),
    );
  }
}
