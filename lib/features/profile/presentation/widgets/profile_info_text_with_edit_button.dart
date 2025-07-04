import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/profile/presentation/views/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';

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
            final id =
                BlocProvider.of<LoginCubit>(context, listen: false).user?.id;
            if (id != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      initialData: initialData,
                      userId: id,
                    ),
                  ));
            }
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
