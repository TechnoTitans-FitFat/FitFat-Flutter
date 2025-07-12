import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:fitfat/features/profile/presentation/widgets/loading_profile_info.dart';
import 'package:fitfat/features/profile/presentation/widgets/profile_info_loaded.dart';
import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    super.key,
    required this.state,
    required this.onEditPressed,
    required this.initialData,
  });
  final UserProfileState state;
  final VoidCallback onEditPressed;
  final Map<String, dynamic> initialData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.85,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.theme.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.theme.blackColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: state is UserProfileLoading
          ? const LoadingProfileInfo()
          : state is UserProfileLoaded
              ? ProfileInfoLoaded(
                  state: state as UserProfileLoaded,
                  initialData: initialData,
                  onEditPressed: onEditPressed,
                )
              : state is UserProfileError
                  ? Center(
                      child:
                          Text('Error: ${(state as UserProfileError).message}'))
                  : const Center(child: Text('No profile data')),
    );
  }
}
