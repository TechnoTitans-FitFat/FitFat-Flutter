import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_elvated_button.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/high_carb_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/high_carb_state.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HighCarbScreen extends StatelessWidget {
  const HighCarbScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     backgroundColor: AppLightColor.backgroundColor,
      appBar:const CustomAppBar(title: 'High-Carb'),
      body:SingleChildScrollView(
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
            child: Text('Discover',
                style: AppStyles.textStyle24
                    .copyWith(color: AppLightColor.mainColor),
                textAlign: TextAlign.left),
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
          BlocConsumer<HighCarbCubit, HighCarbState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HighCarbLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HighCarbFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: AppStyles.textStyle16.copyWith(color: Colors.red),
                  ),
                );
              } else if (state is HighCarbSuccess) {
                // Convert API response to required format
                final List<Map<String, dynamic>> items = state.data.map((diet) {
                  return {
                    'name': diet.name,
                    'image': diet.image,
                    'diet': (diet.diet != null && diet.diet.isNotEmpty)
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
    )
    );
  }
}