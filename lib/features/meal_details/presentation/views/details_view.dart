import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_cubit.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_state.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/details_bottom_bar.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  final String mealId;

  const DetailsView({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
   // print("Navigated to DetailsView with mealId: $mealId");

    // Fetch meal details when entering this screen
    context.read<MealDetailsCubit>().fetchMealsDetailsData(mealId);

    return Scaffold(
      backgroundColor: AppLightColor.backgroundColor,
     body: BlocBuilder<MealDetailsCubit, MealDetailsState>(
  builder: (context, state) {
    if (state is MealDetailsLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is MealDetailsSucess) {
      final meal = state.data.first; // ✅ No need to filter by id anymore

      return Column(
        children: [
          Expanded(child: DetailsViewBody(meal: meal)),
          DetailsBottomBar(price: meal.price),
        ],
      );
    } else if (state is MealDetailsFailure) {
      return Center(
        child: Text(
          "Error: ${state.errMessage}",
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      );
    }
    return const SizedBox();
  },
),

    );
  }
}
