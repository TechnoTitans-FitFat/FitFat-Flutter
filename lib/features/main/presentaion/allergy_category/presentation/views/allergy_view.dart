import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/presentation/widgets/allergy_view_body.dart';
import 'package:fitfat/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AllergyView extends StatelessWidget {
  const AllergyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: CustomAppBar(title: 'Allergy'),
      body: AllergyViewBody(),
      //bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
