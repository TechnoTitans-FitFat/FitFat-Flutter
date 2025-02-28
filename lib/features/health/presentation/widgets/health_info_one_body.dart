import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/current_page_indicator_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/health/presentation/widgets/answers.dart';
import 'package:fitfat/features/health/presentation/widgets/custom_button_skip.dart';
import 'package:fitfat/features/health/presentation/widgets/custom_card_answer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthInfoOneBody extends StatelessWidget {
  const HealthInfoOneBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Profile Setup",
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppLightColor.mainColor,
                  ),
                ),
                const CustomButtonSkip()
              ]),
              const SizedBox(
                height: 5,
              ),
              const CurrentPageIndicatorSection(
                currentPageTitle: 'Health Information',
                nextPageTitle: 'Next: Diet Information',
                value: 2,
                step: 2,
              )
            ],
          ),
        ),
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
                Text(
                  'Do you have any food allergies?',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppLightColor.blackColor,
                  ),
                ),
                Text(
                  '“You can choose more than one option”',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppLightColor.blackColor.withOpacity(.6),
                  ),
                ),
                const Answers(),
                const SizedBox(height: 30),
                Text(
                  'Do you suffer from type of diabetes?',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppLightColor.blackColor,
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    CustomCardAnswer(title: 'Yes'),
                    SizedBox(width: 25),
                    CustomCardAnswer(title: 'No'),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
