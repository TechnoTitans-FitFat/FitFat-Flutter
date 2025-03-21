import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/main/presentaion/widgets/info_text.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: AppLightColor.whiteColor,
        //elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile Information',
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppLightColor.mainColor),
                  ),
                  SvgPicture.asset(Assets.icons.edit)
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'General Information',
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppLightColor.blackColor),
              ),
              const SizedBox(
                height: 15,
              ),
              infoText('Gender', 'female'),
              const SizedBox(
                height: 5,
              ),
              infoText('Date Of Birth', '01/01/1990'),
              const SizedBox(
                height: 5,
              ),
              infoText('Height', '170'),
              const SizedBox(
                height: 5,
              ),
              infoText('Weight', '70'),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: AppLightColor.blackColor,
                endIndent: 24,
              ),
              Text(
                'Health Information',
                style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppLightColor.blackColor),
              ),
              const SizedBox(
                height: 15,
              ),
              infoText('Allergies', 'Peanuts'),
              const SizedBox(
                height: 5,
              ),
              infoText('Type of Diabetes', 'Type 2'),
              const SizedBox(
                height: 5,
              ),
              infoText('Insulin-to-Carb Ratio', '1:15'),
              const SizedBox(
                height: 5,
              ),
              infoText('Blood Sugar Range', '70- 120')
            ],
          ),
        ),
      ),
    );
  }
}
