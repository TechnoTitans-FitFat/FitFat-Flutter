import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/light_colors.dart';

class WeightAndHeightTextField extends StatelessWidget {
  const WeightAndHeightTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.onChanged,
  });

  final String text;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppLightColor.greyColor1,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
