import 'package:fitfat/features/registration_details/health_information/presentation/widgets/food_allergy_question_section.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/widgets/health_information_upper_text.dart';
import 'package:fitfat/features/registration_details/health_information/presentation/widgets/suffer_diabetes_question_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/next_button.dart';
import 'package:flutter/material.dart';

class HealthInfoOneBody extends StatelessWidget {
  const HealthInfoOneBody({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        const HealthInformationUpperText(),
        const SizedBox(
          height: 30,
        ),
        CustomContainerProfileSetUp(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const FoodAllergyQuestionSection(),
                const SizedBox(height: 30),
                const SufferDiabetesQuestionSection(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NextButton(
                        onPressed: onPressed,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
