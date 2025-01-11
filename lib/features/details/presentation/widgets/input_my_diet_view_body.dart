import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/details/presentation/widgets/buttons.dart';
import 'package:fitfat/features/details/presentation/widgets/custom_slider.dart';
import 'package:fitfat/features/details/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputMyDietViewBody extends StatefulWidget {
  const InputMyDietViewBody({super.key});

  @override
  State<InputMyDietViewBody> createState() => _InputMyDietViewBodyState();
}

class _InputMyDietViewBodyState extends State<InputMyDietViewBody> {
  double proteins = 50;

  double carbs = 100;

  double fats = 30;

  double calories = 2000;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            'What type of diet do you follow?',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              CustomButton(
                borderColor: AppLightColor.mainColor,
                widget: "High-Carb",
                widgetColor: AppLightColor.blackColor,
                background: AppLightColor.whiteColor,
                onPressed: () {},
              ),
              const SizedBox(
                width: 25,
              ),
              CustomButton(
                borderColor: AppLightColor.mainColor,
                widget: "Low-Carb",
                widgetColor: AppLightColor.blackColor,
                background: AppLightColor.whiteColor,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              CustomButton(
                borderColor: AppLightColor.mainColor,
                widget: "Vegan",
                widgetColor: AppLightColor.blackColor,
                background: AppLightColor.whiteColor,
                onPressed: () {},
              ),
              const SizedBox(
                width: 53,
              ),
              CustomButton(
                borderColor: AppLightColor.mainColor,
                widget: "Keto",
                widgetColor: AppLightColor.blackColor,
                background: AppLightColor.whiteColor,
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Set Your Macronutrient Goals',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomSlider(
            label: 'Proteins',
            value: proteins,
            min: 0,
            max: 200,
            onChanged: (value) {
              proteins = value;
            },
          ),
           CustomSlider(
            label: 'Carbs',
            value: carbs,
            min: 0,
            max: 300,
            onChanged: (value) {
              carbs = value;
            },
          ),
           CustomSlider(
            label: 'Fats',
            value: fats,
            min: 0,
            max: 100,
            onChanged: (value) {
              fats = value;
            },
          ),
           CustomSlider(
            label: 'Calories',
            value: calories,
            min: 0,
            max: 4000,
            onChanged: (value) {
              calories = value;
            },
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NextButton()
            ],
          )
         
      
        ],
      ),
    );
  }
}
