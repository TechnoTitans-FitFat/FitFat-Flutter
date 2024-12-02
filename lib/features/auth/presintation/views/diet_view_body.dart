import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_bottom_nav_bar.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_card_diet.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_elvated_button.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_list_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class DietViewBody extends StatelessWidget {
  const DietViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextFiled(),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Cateogries',
            style:
                AppStyles.textStyle24.copyWith(color: AppLightColor.mainColor),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCardDiet(
                text: 'Kito',
                height: 55,
                width: 80,
              ),
              CustomCardDiet(
                text: 'Vegan',
                height: 55,
                width: 80,
              ),
              CustomCardDiet(
                text: 'Low-Carb',
                height: 55,
                width: 100,
              ),
              CustomCardDiet(
                text: 'High-Carb',
                height: 55,
                width: 100,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Discover',
            style:
                AppStyles.textStyle24.copyWith(color: AppLightColor.mainColor),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25),
          child: Row(
            children: [
              CustomElvatedButton(
                text: 'All',
                butttonColor: AppLightColor.mainColor,
                textColor: AppLightColor.whiteColor,
              ),
              SizedBox(
                width: 15,
              ),
              CustomElvatedButton(
                text: 'Popular',
                butttonColor: AppLightColor.whiteColor,
                textColor: AppLightColor.mainColor,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomListView(),
        const CustomBottomNavBar(),
      ],
    );
  }
}
