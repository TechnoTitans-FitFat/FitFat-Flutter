import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/current_page_indicator_section.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/custom_container_profile_set_up.dart';
import 'package:fitfat/features/health/presentation/widgets/custom_button_skip.dart';
import 'package:fitfat/features/health/presentation/widgets/diabets_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthInfoTwoBody extends StatefulWidget {
  const HealthInfoTwoBody({super.key});

  @override
  State<HealthInfoTwoBody> createState() => _HealthInfoTwoBodyState();
}

class _HealthInfoTwoBodyState extends State<HealthInfoTwoBody> {
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
                  const CustomButtonSkip(),
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
        ),
        const SizedBox(
          height: 30,
        ),
        const CustomContainerProfileSetUp(
          child:
              Padding(padding: EdgeInsets.all(20), child: DiabetsInformation()),
        ),
      ],
    );
  }
}
