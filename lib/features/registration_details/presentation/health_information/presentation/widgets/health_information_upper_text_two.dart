import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/current_page_indicator_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthInformationUpperTextTwo extends StatelessWidget {
  const HealthInformationUpperTextTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const CurrentPageIndicatorSection(
            currentPageTitle: 'Health Information',
            nextPageTitle: 'Next: Diet Information',
            value: 2,
            step: 2,
          ),
        ],
      ),
    );
  }
}
