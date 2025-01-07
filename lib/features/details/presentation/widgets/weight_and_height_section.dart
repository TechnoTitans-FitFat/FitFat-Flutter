import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/details/presentation/widgets/weight_and_height_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightAndHeightSection extends StatelessWidget {
  const WeightAndHeightSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Weight & Height",
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppLightColor.blackColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              WeightAndHeightTextField(
                text: "Weight",
              ),
              SizedBox(
                width: 10,
              ),
              WeightAndHeightTextField(
                text: "Height",
              )
            ],
          ),
        ],
      ),
    );
  }
}
