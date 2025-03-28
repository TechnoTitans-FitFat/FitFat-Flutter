import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/main/presentaion/diet_category/presentation/widgets/vegan_screen.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_card_diet.dart';
import 'package:fitfat/core/widgets/custom_elvated_button.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_list_view.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:flutter/material.dart';

class AllergyViewBody extends StatelessWidget {
  const AllergyViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Tuna Crunch',
        'imagePath': 'imges/meal1.jpg',
        'type': 'lactose',
        'calories': '350',
        'showType': true,
        'price': 170
      },
      {
        'title': 'Veggie Delight',
        'imagePath': 'imges/meal2.png',
        'type': 'sellfish',
        'calories': '200',
        'showType': true,
        'price': 170
      },
      {
        'title': 'Chicken Salad',
        'imagePath': 'imges/meal3.png',
        'type': 'wheat',
        'calories': '400',
        'showType': true,
        'price': 170
      },
      {
        'title': 'Tuna Crunch',
        'imagePath': 'imges/meal1.jpg',
        'type': 'lactose',
        'calories': '350',
        'showType': true,
        'price': 170
      },
      {
        'title': 'Veggie Delight',
        'imagePath': 'imges/meal2.png',
        'type': 'sellfish',
        'calories': '200',
        'showType': true,
        'price': 170
      },
      {
        'title': 'Chicken Salad',
        'imagePath': 'imges/meal3.png',
        'type': 'wheat',
        'calories': '400',
        'showType': true,
        'price': 170
      },
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CustomTextFiledSearch(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Cateogries',
              style: AppStyles.textStyle24
                  .copyWith(color: AppLightColor.mainColor),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCardDiet(
                  text: 'Lactose',
                  height: 55,
                  width: 80, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const VeganScreen()));
                    }
                ),
                CustomCardDiet(
                  text: 'Shellfish',
                  height: 55,
                  width: 80, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const VeganScreen()));
                    }
                ),
                CustomCardDiet(
                  text: 'Wheat',
                  height: 55,
                  width: 100, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const VeganScreen()));
                    }
                ),
                CustomCardDiet(
                  text: 'Peanuts',
                  height: 55,
                  width: 100, onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const VeganScreen()));
                    }
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
              style: AppStyles.textStyle24
                  .copyWith(color: AppLightColor.mainColor),
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
         // CustomListView(items: items),
        ],
      ),
    );
  }
}
