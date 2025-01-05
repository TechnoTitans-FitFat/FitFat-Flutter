import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentPageAndNextPageProfileSetUp extends StatelessWidget {
  const CurrentPageAndNextPageProfileSetUp({
    super.key,
    required this.currentPageTitle,
    required this.nextPageTitle,
  });
  final String currentPageTitle;
  final String nextPageTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentPageTitle,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppLightColor.blackColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 50,
          ),
          child: Text(
            nextPageTitle,
            style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: AppLightColor.greyColor,
            ),
          ),
        )
      ],
    );
  }
}
