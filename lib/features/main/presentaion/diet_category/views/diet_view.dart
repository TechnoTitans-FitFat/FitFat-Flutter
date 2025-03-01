import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/core/widgets/custom_bottom_nav_bar.dart';
import 'package:fitfat/features/main/presentaion/diet_category/widgets/diet_view_body.dart';
import 'package:flutter/material.dart';

class DietView extends StatelessWidget {
  const DietView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppLightColor.backgroundColor,
      appBar: CustomAppBar(title: 'Diet'),
      body: DietViewBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
