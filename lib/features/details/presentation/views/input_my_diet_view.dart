import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/details/presentation/widgets/current_page_indicator_section.dart';
import 'package:fitfat/features/details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/details/presentation/widgets/input_my_diet_view_body.dart';
import 'package:fitfat/features/details/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputMyDietView extends StatelessWidget {
  const InputMyDietView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.secondColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile Setup",
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppLightColor.mainColor,
                      ),
                    ),
                    SkipButton(
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const CurrentPageIndicatorSection(
                  nextPageTitle: "Next: Start Your Journey!",
                  currentPageTitle: "Diet Information",
                  value: 3,
                  step: 3,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomContainerProfileSetUp(
              child:Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: InputMyDietViewBody(),
              ) )
        ],
      ),
    );
  }
}
