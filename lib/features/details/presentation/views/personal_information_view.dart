import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/details/presentation/widgets/current_page_indicator_section.dart';
import 'package:fitfat/features/details/presentation/widgets/personal_information_section.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

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
                Text(
                  "Profile Setup",
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppLightColor.mainColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const CurrentPageIndicatorSection(
                  nextPageTitle: "Next: Health Information",
                  currentPageTitle: "Personal Information",
                  value: 1,
                  step: 1,
                ),
              ],
            ),
          ),
          const PersonalInformationSection(),
        ],
      ),
    );
  }
}
