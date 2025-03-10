import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypeOfDiabetesQuestionSection extends StatelessWidget {
  const TypeOfDiabetesQuestionSection({
    super.key,
    this.selectedType = "",
    this.onTypeSelected,
  });

  final String selectedType;
  final Function(String)? onTypeSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What type of diabetes do you have?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppLightColor.blackColor,
          ),
        ),
        const SizedBox(height: 15),
        RadioListTile<String>(
          title: RichText(
            text: TextSpan(
              text: 'Type 1',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppLightColor.blackColor,
              ),
              children: [
                TextSpan(
                  text: '\n"Your Body Doesn\'t Produce Insulin"',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          value: 'Type 1',
          groupValue: selectedType,
          activeColor: Colors.red,
          onChanged: (value) => onTypeSelected?.call(value ?? ''),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        ),
        RadioListTile<String>(
          title: RichText(
            text: TextSpan(
              text: 'Type 2',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppLightColor.blackColor,
              ),
              children: [
                TextSpan(
                  text: '\n"Your Body Doesn\'t Use Insulin Properly"',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          value: 'Type 2',
          groupValue: selectedType,
          activeColor: Colors.red,
          onChanged: (value) => onTypeSelected?.call(value ?? ''),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        ),
      ],
    );
  }
}
