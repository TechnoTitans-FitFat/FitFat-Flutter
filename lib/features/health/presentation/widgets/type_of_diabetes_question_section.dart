import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/light_colors.dart' show AppLightColor;

class TypeOfDiabetesQuestionSection extends StatefulWidget {
  const TypeOfDiabetesQuestionSection({super.key});

  @override
  State<TypeOfDiabetesQuestionSection> createState() =>
      _TypeOfDiabetesQuestionSectionState();
}

class _TypeOfDiabetesQuestionSectionState
    extends State<TypeOfDiabetesQuestionSection> {
  String? selectedType;
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
        const SizedBox(height: 10),
        // Type 1 RadioListTile
        RadioListTile<String>(
          activeColor: AppLightColor.mainColor,
          value: 'Type 1',
          groupValue: selectedType,
          onChanged: (String? value) {
            setState(() {
              selectedType = value;
            });
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type 1',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '“Your Body Doesn\'t Produce Insulin”',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          contentPadding: EdgeInsets.zero, // Remove default padding
        ),
        // Type 2 RadioListTile
        RadioListTile<String>(
          activeColor: AppLightColor.mainColor,
          value: 'Type 2',
          groupValue: selectedType,
          onChanged: (String? value) {
            setState(() {
              selectedType = value;
            });
          },
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type 2',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                '“Your Body Doesn\'t Use Insulin Properly”',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
          contentPadding: EdgeInsets.zero, // Remove default padding
        ),
      ],
    );
  }
}
