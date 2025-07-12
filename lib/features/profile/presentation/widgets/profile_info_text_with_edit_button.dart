import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoTextWithEditButton extends StatelessWidget {
  const ProfileInfoTextWithEditButton({
    super.key,
    required this.initialData,
    required this.onEditPressed,
  });
  final Map<String, dynamic> initialData;
  final VoidCallback onEditPressed;

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
            color: context.theme.mainColor,
          ),
        ),
        GestureDetector(
          onTap: onEditPressed,
          child: Icon(
            Icons.edit,
            color: context.theme.mainColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
