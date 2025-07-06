import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:fitfat/features/profile/presentation/widgets/diet_info_section.dart';
import 'package:fitfat/features/profile/presentation/widgets/divider_section.dart';
import 'package:fitfat/features/profile/presentation/widgets/general_info_section.dart';
import 'package:fitfat/features/profile/presentation/widgets/profile_info_text_with_edit_button.dart';
import 'package:flutter/material.dart';

class ProfileInfoLoaded extends StatelessWidget {
  const ProfileInfoLoaded(
      {super.key, required this.state, required this.initialData});
  final UserProfileLoaded state;
  final Map<String, dynamic> initialData;

  @override
  Widget build(BuildContext context) {
    final healthInfo = state.userProfile.healthInfo.isNotEmpty
        ? state.userProfile.healthInfo.first
        : null;
    final dietInfo = state.userProfile.dietInfo.isNotEmpty
        ? state.userProfile.dietInfo.first
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInfoTextWithEditButton(
          initialData: initialData,
        ),
        const SizedBox(height: 20),
        GeneralInfoSection(healthInfo: healthInfo),
        const DividerSection(),
        DietInfoSection(dietInfo: dietInfo)
      ],
    );
  }
}
