import 'dart:math';

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('imges/jinx.jpg'),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Text(
                'Mai Wael',
                style:
                    GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              Text(
                'mai@gmail.com',
                style:
                    GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(
            width: 319,
            height: 500,
            child: Card(
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: AppLightColor.whiteColor,
              //elevation: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
      
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Profile Information',
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: AppLightColor.mainColor),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        SvgPicture.asset('imges/edit.svg')
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
                      height:5,
                    ),
                   infoText('Blood Sugar Range', '70- 120')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget infoText(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppLightColor.blackColor)),
        Text(value,
            style: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey)),
      ],
    ),
  );
}
