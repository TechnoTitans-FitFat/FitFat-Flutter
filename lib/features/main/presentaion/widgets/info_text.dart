import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

