import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_cubit.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_state.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/details_bottom_bar.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/details_view_body.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  final String mealId;
  final bool isMenu;

  const DetailsView({super.key, required this.mealId, required this.isMenu});

  @override
  Widget build(BuildContext context) {
    // print("Navigated to DetailsView with mealId: $mealId");

    // Fetch meal details when entering this screen
    context.read<MealDetailsCubit>().fetchMealsDetailsData(mealId);
    final token =
        BlocProvider.of<LoginCubit>(context, listen: false).user?.token;
    if (token != null) {
      BlocProvider.of<UserProfileCubit>(context).getUserProfile(token: token);
    }
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: BlocBuilder<MealDetailsCubit, MealDetailsState>(
        builder: (context, mealState) {
          if (mealState is MealDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (mealState is MealDetailsSucess) {
            final meal = mealState.data.first;

            return BlocBuilder<UserProfileCubit, UserProfileState>(
              builder: (context, profileState) {
                if (profileState is UserProfileLoaded) {
                  final healthInfo = profileState.userProfile.healthInfo.first;

                  return Column(
                    children: [
                      Expanded(
                          child: DetailsViewBody(
                        meal: meal,
                        isMenu: isMenu,
                        healthInfo: healthInfo,
                      )),
                      DetailsBottomBar(
                        price: meal.price,
                        id: meal.id,
                        meal: meal,
                        healthInfo: healthInfo,
                      ),
                    ],
                  );
                } else if (profileState is UserProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text('Error loading profile'));
                }
              },
            );
          } else if (mealState is MealDetailsFailure) {
            return Center(
              child: Text(
                "Error: ${mealState.errMessage}",
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
