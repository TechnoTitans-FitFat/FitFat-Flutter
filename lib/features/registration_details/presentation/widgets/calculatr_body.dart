import 'package:fitfat/features/registration_details/presentation/widgets/activity_radio_button.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/diet_goals_selection.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/type_of_meal_selection.dart';
import 'package:flutter/material.dart';

class CalculatrBody extends StatelessWidget {
  const CalculatrBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const DietGoalsSelection(),
          const SizedBox(
            height: 24,
          ),
          const ActivityRadioButton(),
          const TypeOfMealSelection(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NextButton(
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
