import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/presentation/widgets/diabetes_view_body.dart';
import 'package:flutter/material.dart';

class DiabetesView extends StatelessWidget {
  const DiabetesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: CustomAppBar(title: 'Diabetes'),
      body: DiabetesViewBody(),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
