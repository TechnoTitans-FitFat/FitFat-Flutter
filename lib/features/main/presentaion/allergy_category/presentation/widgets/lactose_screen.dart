import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_elvated_button.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/lactose_cubit.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/lactose_state.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LactoseScreen extends StatelessWidget {
  const LactoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppLightColor.backgroundColor,
        appBar: const CustomAppBar(title: 'Lactose'),
        body: SingleChildScrollView(
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
              BlocConsumer<LactoseCubit, LactoseState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LactoseLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LactoseFailure) {
                    return Center(
                      child: Text(
                        state.errMessage,
                        style:
                            AppStyles.textStyle16.copyWith(color: Colors.red),
                      ),
                    );
                  } else if (state is LactoseSuccess) {
                    // Convert API response to required format
                    final List<AllergyModel> allergyList = state.data;

                    return CategoriesListView<AllergyModel>(
                      items: allergyList,
                      getId: (item) => item.id,
                      getName: (item) => item.name,
                      getImage: (item) => item.image,
                      getType: (item) =>
                          item.allergy.isNotEmpty ? item.allergy.first : "Unknown",
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
        ));
  }
}
