import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_meal_datails.dart';
import 'package:fitfat/features/main/presentaion/widgets/intgredient_meal.dart';
import 'package:fitfat/features/main/presentaion/widgets/nutrients_list.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: AppLightColor.secondColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Image.asset(
                  'imges/Frame 38.png',
                  height: 190,
                  width: 190,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color:  Color(0xffF5F5F5),
              borderRadius: BorderRadius.only(topLeft:Radius.circular(45),topRight: Radius.circular(45) )
            ),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomMealDatails(),
                  const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('Nutrients',style: AppStyles.textStyle24.copyWith(fontSize: 20),),
                ), 
                const SizedBox(height: 18),
                const NutrientsList(),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text('Ingredients',style: AppStyles.textStyle24.copyWith(fontSize: 20)),
                ),
                const SizedBox(height: 18),
                const IntgredientMeal(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
