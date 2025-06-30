import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:fitfat/features/profile/presentation/widgets/loading_profile_info.dart';
import 'package:fitfat/features/profile/presentation/widgets/profile_info_loaded.dart';
import 'package:flutter/material.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({
    super.key,
    required this.state,
  });
  final UserProfileState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.85,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppLightColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
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
                  initialData: {
                      'gender': (state as UserProfileLoaded)
                          .userProfile
                          .healthInfo[0]
                          .gender,
                      "dateOfBirth": {
                        'month': 'January',
                        'day': '15',
                        'year': '1990',
                      },
                      'height': (state as UserProfileLoaded)
                          .userProfile
                          .healthInfo[0]
                          .height,
                      'weight': (state as UserProfileLoaded)
                          .userProfile
                          .healthInfo[0]
                          .weight,
                      'allergies': (state as UserProfileLoaded)
                          .userProfile
                          .healthInfo[0]
                          .foodAllergies,
                      'diabetesType': (state as UserProfileLoaded)
                          .userProfile
                          .healthInfo[0]
                          .diabetesType,
                      'insulinToCarbRatio': 12,
                      'correctionFactor': (state as UserProfileLoaded)
                          .userProfile
                          .healthInfo[0]
                          .correctionFactor,
                      'dietType': (state as UserProfileLoaded)
                          .userProfile
                          .dietInfo[0]
                          .dietType,
                      'macronutrientGoals': {
                        'proteins': (state as UserProfileLoaded)
                            .userProfile
                            .dietInfo[0]
                            .macronutrientGoals
                            .proteins,
                        'carbs': (state as UserProfileLoaded)
                            .userProfile
                            .dietInfo[0]
                            .macronutrientGoals
                            .carbs,
                        'fats': (state as UserProfileLoaded)
                            .userProfile
                            .dietInfo[0]
                            .macronutrientGoals
                            .fats,
                        'calories': (state as UserProfileLoaded)
                            .userProfile
                            .dietInfo[0]
                            .macronutrientGoals
                            .calories,
                      },
                      'dietaryGoals': (state as UserProfileLoaded)
                          .userProfile
                          .dietInfo[0]
                          .dietaryGoals,
                      'activityLevel': (state as UserProfileLoaded)
                          .userProfile
                          .dietInfo[0]
                          .activityLevel,
                      'mealPreferences': (state as UserProfileLoaded)
                          .userProfile
                          .dietInfo[0]
                          .mealPreferences,
                    })
              : state is UserProfileError
                  ? Center(
                      child:
                          Text('Error: ${(state as UserProfileError).message}'))
                  : const Center(
                      child: Text(
                        'No profile data',
                      ),
                    ),
    );
  }
}
