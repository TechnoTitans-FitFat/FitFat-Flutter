import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightAndHeightTextField extends StatelessWidget {
  const WeightAndHeightTextField({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppLightColor.greyColor1,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
