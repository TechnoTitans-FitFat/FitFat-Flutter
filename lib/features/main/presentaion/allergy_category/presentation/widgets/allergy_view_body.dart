import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/allergy_state.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/allregy_cubit.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/presentation/widgets/lactose_screen.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/presentation/widgets/peanuts_screen.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/presentation/widgets/shellfish_screen.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/presentation/widgets/wheat_screen.dart';
import 'package:fitfat/features/main/presentaion/widgets/categories_list_view.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_card.dart';
import 'package:fitfat/core/widgets/custom_elvated_button.dart';
import 'package:fitfat/core/widgets/custom_text_filed_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllergyViewBody extends StatefulWidget {
  const AllergyViewBody({super.key});

  @override
  State<AllergyViewBody> createState() => _AllergyViewBodyState();
}

class _AllergyViewBodyState extends State<AllergyViewBody> {
  @override
  void initState() {
    super.initState();
    // Fetch diet data when the screen loads
    context.read<AllregyCubit>().fetchAllergyData();
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
                  .copyWith(color: context.theme.mainColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomCard(
                    text: 'Lactose',
                    height: 55,
                    width: 80,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LactoseScreen()));
                    },
                  ),
                  CustomCard(
                    text: 'Shellfish',
                    height: 55,
                    width: 80,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShellfishScreen()));
                    },
                  ),
                  CustomCard(
                    text: 'Wheat',
                    height: 55,
                    width: 100,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WheatScreen()));
                    },
                  ),
                  CustomCard(
                    text: 'Peanuts',
                    height: 55,
                    width: 100,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PeanutsScreen()));
                    },
                  ),
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
                  .copyWith(color: context.theme.mainColor),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              children: [
                CustomElvatedButton(
                  text: 'All',
                  butttonColor: context.theme.mainColor,
                  textColor: context.theme.whiteColor,
                ),
                const SizedBox(width: 15),
                CustomElvatedButton(
                  text: 'Popular',
                  butttonColor: context.theme.whiteColor,
                  textColor: context.theme.mainColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // BlocConsumer listens to DietCubit state
          BlocConsumer<AllregyCubit, AllergyState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AllergyLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AllergyFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: AppStyles.textStyle16.copyWith(color: Colors.red),
                  ),
                );
              } else if (state is AllergySucess) {
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
                  getPrice: (item) => item.price,
                  getRating: (item) => item.rating,
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
