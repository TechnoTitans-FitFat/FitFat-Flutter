import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget infoText(String title, String value, dynamic context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: context.theme.blackColor)),
        Text(value,
            style: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey)),
      ],
    ),
  );
}
