import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonSkip extends StatelessWidget {
  const CustomButtonSkip({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 77,
      decoration: BoxDecoration(
          color: context.theme.secondColor,
          border: Border.all(color: context.theme.blackColor.withOpacity(.4),),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Skip',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: context.theme.blackColor.withOpacity(.4),
            ),
          ),
           Icon(
            Icons.arrow_forward,
            color: context.theme.blackColor.withOpacity(.4),
            size: 19,
          )
        ],
      ),
    );
  }
}
