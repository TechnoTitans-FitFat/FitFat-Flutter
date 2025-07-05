import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularPercentIndecitor extends StatelessWidget {
  const CustomCircularPercentIndecitor({
    super.key,
    required this.percentage,
    required this.step,
  });

  final double percentage;
  final int step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.5),
      child: CircularPercentIndicator(
        animation: true,
        circularStrokeCap: CircularStrokeCap.round,
        linearGradient: LinearGradient(
          colors: [
            context.theme.mainColor,
            context.theme.mainColor,
          ],
          stops: [0.0, 0.1],
        ),
        progressBorderColor: context.theme.greyColor,
        radius: 40,
        lineWidth: 5,
        percent: percentage,
        startAngle: 0,
        backgroundColor: context.theme.greyColor,
        center: Text(
          "$step of 3",
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: context.theme.blackColor,
          ),
        ),
      ),
    );
  }
}
