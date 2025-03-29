import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/core/widgets/custom_elvated_button.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/data/diabets_cubit/diabets_cubit.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/data/diabets_cubit/diabets_state.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/data/models/diabets_model.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list_view.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiabetesViewBody extends StatefulWidget {
  const DiabetesViewBody({super.key});

  @override
  State<DiabetesViewBody> createState() => _DiabetesViewBodyState();
}

class _DiabetesViewBodyState extends State<DiabetesViewBody> {
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
          BlocConsumer<DiabetsCubit, DiabetsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is DiabetsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DiabetsFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: AppStyles.textStyle16.copyWith(color: Colors.red),
                  ),
                );
              } else if (state is DiabetsSucess) {
                // Convert API response to required format
                final List<DiabetsModel> diabetsList = state.data;

                return SingleChildScrollView(
                  child: CategoriesListView<DiabetsModel>(
                   // items: diabetsList,
                    getId: (item) => item.id,
                    getName: (item) => item.name,
                    getImage: (item) => item.image,
                    getCalories: (item) => item.calories,
                    getPrice: (item) => item.price, 
                    getRating: (item) => item.rating, 
                    items: diabetsList,
                  ),
                );
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
