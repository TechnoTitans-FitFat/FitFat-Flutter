import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardAnswer extends StatelessWidget {
  const CustomCardAnswer({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? context.theme.mainColor : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? context.theme.mainColor
                : context.theme.blackColor.withOpacity(.1),
            width: 1.5,
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: isSelected ? context.theme.whiteColor : context.theme.blackColor,
          ),
        ),
      ),
    );
  }
}
