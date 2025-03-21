import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTileButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTileButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppLightColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: 15,
            ),
          ),
          backgroundColor: WidgetStateProperty.all(
            Colors.transparent,
          ),
          overlayColor: WidgetStateProperty.all(
            AppLightColor.mainColor.withOpacity(
              0.2,
            ),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            spacing: 10,
            children: [
              Icon(
                icon,
                color: AppLightColor.greyColor,
              ),
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppLightColor.blackColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
