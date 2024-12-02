import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_card_diet.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_elvated_button.dart';
import 'package:fitfat/features/auth/presintation/views/diet_view_body.dart';
import 'package:fitfat/features/main/presentaion/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppLightColor.backgroundColor,
        appBar: AppBar(
          title: Center(
              child: Text(
            'Diet',
            style: AppStyles.textStyle24.copyWith(
              color: AppLightColor.mainColor,
            ),
          )),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppLightColor.mainColor),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ),
        body: const DietViewBody());
  }
}
