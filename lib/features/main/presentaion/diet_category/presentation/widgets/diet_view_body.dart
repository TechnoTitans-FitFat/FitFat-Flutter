import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/diet_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/diet_state.dart';
import 'package:fitfat/features/main/presentaion/diet_category/presentation/widgets/high_carb_screen.dart';
import 'package:fitfat/features/main/presentaion/diet_category/presentation/widgets/keto_screen.dart';
import 'package:fitfat/features/main/presentaion/diet_category/presentation/widgets/low_carb_screen.dart';
import 'package:fitfat/features/main/presentaion/diet_category/presentation/widgets/vegan_screen.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_card_diet.dart';
import 'package:fitfat/core/widgets/custom_elvated_button.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_list_view.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DietViewBody extends StatefulWidget {
  const DietViewBody({super.key});

  @override
  State<DietViewBody> createState() => _DietViewBodyState();
}

class _DietViewBodyState extends State<DietViewBody> {
  @override
  void initState() {
    super.initState();
    // Fetch diet data when the screen loads
    context.read<DietCubit>().fetchDietData();
  }

  @override
  Widget build(BuildContext context) {
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
              'Categories',
              style: AppStyles.textStyle24
                  .copyWith(color: AppLightColor.mainColor),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 25),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCardDiet(
                    text: 'Keto',
                    height: 55,
                    width: 80,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const KetoScreen()));
                    },
                  ),
                  CustomCardDiet(text: 'Vegan', height: 55, width: 80,onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const VeganScreen()));
                    },),
                  CustomCardDiet(text: 'Low-Carb', height: 55, width: 100,onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LowCarbScreen()));
                    },),
                  CustomCardDiet(text: 'High-Carb', height: 55, width: 100,onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const HighCarbScreen()));
                    },),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Discover',
              style: AppStyles.textStyle24
                  .copyWith(color: AppLightColor.mainColor),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              children: [
                CustomElvatedButton(
                  text: 'All',
                  butttonColor: AppLightColor.mainColor,
                  textColor: AppLightColor.whiteColor,
                ),
                SizedBox(width: 15),
                CustomElvatedButton(
                  text: 'Popular',
                  butttonColor: AppLightColor.whiteColor,
                  textColor: AppLightColor.mainColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // BlocConsumer listens to DietCubit state
          BlocConsumer<DietCubit, DietState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is DietLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DietFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: AppStyles.textStyle16.copyWith(color: Colors.red),
                  ),
                );
              } else if (state is DietSuccess) {
                // Convert API response to required format
                final List<Map<String, dynamic>> items = state.data.map((diet) {
                  return {
                    'name': diet.name,
                    'image': diet.image,
                    'diet': (diet.diet.isNotEmpty)
                        ? diet.diet.first
                        : 'No diet info',
                    'calories': diet.calories,
                    'showType': false,
                    'price': diet.price, // Ensure price is set correctly
                    'favourite': false,
                    'onFavouriteTap': () {},
                    'rating': diet.rating
                  };
                }).toList();

                return CustomListView(items: items);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
