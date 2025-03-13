import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/calculatw_diet/calculate_diet_view.dart';
import 'package:fitfat/features/registration_details/presentation/input_my_diet/presentation/view/input_my_diet_view.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class DietDeterminationWaySelection extends StatelessWidget {
  const DietDeterminationWaySelection({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "How would you like to determine your diet information?",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              flex: 10,
              borderColor: AppLightColor.mainColor,
              widget: "Input My Diet",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InputMyDietView(
                              userId: userId,
                            )));
              },
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButton(
              flex: 13,
              borderColor: AppLightColor.mainColor,
              widget: "CalCulate it For Me",
              widgetColor: AppLightColor.blackColor,
              background: AppLightColor.whiteColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return CalculateDietView(userId: userId);
                  },
                ));
              },
            ),
          ],
        )
      ],
    );
  }
}
