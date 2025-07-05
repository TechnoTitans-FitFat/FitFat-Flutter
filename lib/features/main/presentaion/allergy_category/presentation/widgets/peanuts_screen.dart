import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_elvated_button.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/peanuts_cubit.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/peanuts_state.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeanutsScreen extends StatelessWidget {
  const PeanutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: const CustomAppBar(title: 'Peanuts'),
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
                        .copyWith(color: context.theme.mainColor),
                    textAlign: TextAlign.left),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    CustomElvatedButton(
                      text: 'All',
                      butttonColor: context.theme.mainColor,
                      textColor: context.theme.whiteColor,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CustomElvatedButton(
                      text: 'Popular',
                      butttonColor: context.theme.whiteColor,
                      textColor: context.theme.mainColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<PeanutsCubit, PeanutsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is PeanutsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PeanutsFailure) {
                    return Center(
                      child: Text(
                        state.errMessage,
                        style:
                            AppStyles.textStyle16.copyWith(color: Colors.red),
                      ),
                    );
                  } else if (state is PeanutsSuccess) {
                    // Convert API response to required format
                    final List<AllergyModel> allergyList = state.data;

                    return CategoriesListView<AllergyModel>(
                      items: allergyList,
                      getId: (item) => item.id,
                      getName: (item) => item.name,
                      getImage: (item) => item.image,
                      getType: (item) => item.allergy.isNotEmpty
                          ? item.allergy.first
                          : "Unknown",
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
