import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/meal_details/presentation/widgets/insulin_dialog.dart';
import 'package:flutter/material.dart';

class InsulinCalc extends StatelessWidget {
  const InsulinCalc({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (BuildContext context) => const InsulinDialog(),
        );
      },
      child: Container(
        height: 40,
        width: 119,
        decoration: BoxDecoration(
            color: AppLightColor.backgroundColor,
            borderRadius: BorderRadius.circular(21),
            border: Border.all(color: AppLightColor.mainColor, width: 1.4)),
        child: Center(
            child: Text(
          'Insulin Calc',
          style: AppStyles.textStyle16.copyWith(
            color: AppLightColor.mainColor,
          ),
        )),
      ),
    );
  }
}
