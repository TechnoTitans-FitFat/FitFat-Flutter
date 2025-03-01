import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/custom_app_bar_details.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/details_bottom_bar.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/details_view_body.dart'
    show DetailsViewBody;
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppLightColor.secondColor,
      appBar: CustomAppBarDetails(),
      body: DetailsViewBody(),
      bottomNavigationBar: DetailsBottomBar(),
    );
  }
}
