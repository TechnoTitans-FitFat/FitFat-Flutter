import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsulinToCardRatioQuestionSection extends StatelessWidget {
  const InsulinToCardRatioQuestionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is your Insulin-to-Carb Ratio?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppLightColor.blackColor,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 98,
          height: 36,
          child: TextField(
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: '1:10',
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppLightColor.mainColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
