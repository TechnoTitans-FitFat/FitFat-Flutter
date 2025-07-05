import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/features/main/presentaion/diet_category/presentation/widgets/diet_view_body.dart';
import 'package:flutter/material.dart';

class DietView extends StatelessWidget {
  const DietView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: const CustomAppBar(title: 'Diet'),
      body: const DietViewBody(),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
