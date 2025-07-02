import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsulinToCardRatioQuestionSection extends StatelessWidget {
  const InsulinToCardRatioQuestionSection({
    super.key,
    this.ratio = 0.0,
    this.onRatioChanged,
  });

  final double ratio;
  final Function(double)? onRatioChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is your insulin to carb ratio?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: context.theme.blackColor,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
