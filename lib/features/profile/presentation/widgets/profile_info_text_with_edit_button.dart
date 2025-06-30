import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/profile/presentation/views/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfoTextWithEditButton extends StatelessWidget {
  const ProfileInfoTextWithEditButton({
    super.key,
    required this.initialData,
  });
  final Map<String, dynamic> initialData;

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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(
                    initialData: initialData,
                  ),
                ));
          },
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
