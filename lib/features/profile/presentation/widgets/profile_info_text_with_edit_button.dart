import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoTextWithEditButton extends StatelessWidget {
  const ProfileInfoTextWithEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Profile Information',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppLightColor.mainColor,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.edit,
            color: AppLightColor.mainColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
