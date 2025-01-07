import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/details/presentation/widgets/calculatr_body.dart';
import 'package:fitfat/features/details/presentation/widgets/current_page_indicator_section.dart';
import 'package:fitfat/features/details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/health/presentation/widgets/custom_button_skip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateDietView extends StatelessWidget {
  const CalculateDietView({super.key});

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
                    const CustomButtonSkip()
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
          const Expanded(
            child: SingleChildScrollView(
              child: CustomContainerProfileSetUp(
                child: Padding(
                  padding: EdgeInsets.only(top: 35),
                  child: CalculatrBody(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}