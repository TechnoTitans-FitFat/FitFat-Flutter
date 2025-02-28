import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_cubit.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_state.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/custom_app_bar_details.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/details_bottom_bar.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/details_view_body.dart'
    show DetailsViewBody;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.secondColor,
      appBar: const CustomAppBarDetails(),
      body: BlocBuilder<MealDetailsCubit, MealDetailsState>(
        builder: (context, state) {
          if (state is MealDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MealDetailsSucess) {
          //  final data =state.data.take(6).toList();
           // return DetailsViewBody(imageUrl: );
          } else if (state is MealDetailsFailure) {
            return Center(child: Text("Error: ${state.errMessage}"));
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: const DetailsBottomBar(),
    );
  }
}
