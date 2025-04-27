import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_elvated_button.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/vegan_cubit.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/vegan_state.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VeganScreen extends StatelessWidget {
  const VeganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: AppLightColor.backgroundColor,
      appBar:const CustomAppBar(title: 'Vegan'),
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
          BlocConsumer<VeganCubit, VeganState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is VeganLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is VeganFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: AppStyles.textStyle16.copyWith(color: Colors.red),
                  ),
                );
              } else if (state is VeganSuccess) {
                // Convert API response to required format
                final List<DietModel> dietList = state.data;

                    return CategoriesListView<DietModel>(
                      items: dietList,
                      getId: (item) => item.id,
                      getName: (item) => item.name,
                      getImage: (item) => item.image,
                      getType: (item) =>
                          item.diet.isNotEmpty ? item.diet.first : "Unknown",
                      getCalories: (item) => item.calories,
                      getPrice: (item) => item
                          .price, // Ensure it's converted to string if needed
                      getRating: (item) => item.rating,
                    );
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
