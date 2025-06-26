import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:fitfat/features/profile/presentation/widgets/loading_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeder extends StatelessWidget {
  const ProfileHeder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileLoading) {
          return const LoadingProfileHeader();
        } else if (state is UserProfileLoaded) {
          return Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppLightColor.whiteColor, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: state.userProfile.profile != null
                      ? Image.network(
                          state.userProfile.profile!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade300,
                              child: const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.grey,
                              ),
                            );
                          },
                        )
                      : Container(
                          color: Colors.grey.shade300,
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: AppLightColor.greyColor,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                state.userProfile.username,
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppLightColor.blackColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                state.userProfile.email,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: AppLightColor.greyColor,
                ),
              ),
            ],
          );
        } else if (state is UserProfileError) {
          return Column(
            children: [
              const Icon(Icons.error, size: 40, color: AppLightColor.mainColor),
              const SizedBox(height: 8),
              Text(
                'Error: ${state.message}',
                style: const TextStyle(color: AppLightColor.mainColor),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
