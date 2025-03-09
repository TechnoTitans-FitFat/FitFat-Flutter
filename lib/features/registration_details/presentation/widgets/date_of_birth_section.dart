import 'package:fitfat/features/registration_details/presentation/widgets/day_box_pick_date_of_birth.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/month_box_pick_date_of_birth.dart';
import 'package:fitfat/features/registration_details/presentation/widgets/year_box_date_of_birth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/light_colors.dart';

class DateOfBirthSection extends StatelessWidget {
  const DateOfBirthSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date of birth",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              DayBoxPickDateOfBirth(),
              Spacer(),
              MonthBoxPickDateOfBirth(),
              Spacer(),
              YearBoxDateOfBirth(),
            ],
          ),
        ],
      ),
    );
  }
}
