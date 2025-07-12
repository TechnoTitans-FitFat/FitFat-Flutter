import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:fitfat/features/profile/presentation/cubit/profile_cubit/profile_state.dart';
import 'package:fitfat/features/profile/presentation/views/update_profile_screen.dart';
import 'package:fitfat/features/profile/presentation/widgets/general_settings_section.dart';
import 'package:fitfat/features/profile/presentation/widgets/profile_heder.dart';
import 'package:fitfat/features/profile/presentation/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  void _fetchProfile() {
    final token =
        BlocProvider.of<LoginCubit>(context, listen: false).user?.token;
    if (token != null) {
      BlocProvider.of<UserProfileCubit>(context).getUserProfile(token: token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.secondColor,
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    const ProfileHeder(),
                    const SizedBox(height: 30),
                    ProfileInfoCard(
                      state: state,
                      initialData: state is UserProfileLoaded
                          ? _buildInitialData(state)
                          : {},
                      onEditPressed: () {
                        if (state is UserProfileLoaded) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                initialData: _buildInitialData(state),
                                userId: state.userProfile.id,
                                userToken: BlocProvider.of<LoginCubit>(context,
                                        listen: false)
                                    .user
                                    ?.token,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Profile data not available.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    GeneralSettingsSection(
                      context: context,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Map<String, dynamic> _buildInitialData(UserProfileLoaded state) {
    final healthInfo = state.userProfile.healthInfo.isNotEmpty
        ? state.userProfile.healthInfo.first
        : null;
    final dietInfo = state.userProfile.dietInfo.isNotEmpty
        ? state.userProfile.dietInfo.first
        : null;

    return {
      'gender': healthInfo?.gender ?? 'Female',
      'dateOfBirth': {
        'month': _formatMonth(healthInfo?.dateOfBirth.month ?? 1),
        'day': healthInfo?.dateOfBirth.day.toString() ?? '1',
        'year': healthInfo?.dateOfBirth.year.toString() ?? '1990',
      },
      'height': healthInfo?.height.toString() ?? '170',
      'weight': healthInfo?.weight.toString() ?? '70',
      'foodAllergies': healthInfo?.foodAllergies ?? 'None',
      'diabetesType': healthInfo?.diabetesType ?? 'None',
      'insulinToCarbRatio': healthInfo?.insulinToCarbRatio.toString() ?? '15',
      'correctionFactor': healthInfo?.correctionFactor.toString() ?? '50',
      'dietType': dietInfo?.dietType ?? 'Keto',
      'macronutrientGoals': {
        'proteins': dietInfo?.macronutrientGoals.proteins.toString() ?? '100',
        'carbs': dietInfo?.macronutrientGoals.carbs.toString() ?? '50',
        'fats': dietInfo?.macronutrientGoals.fats.toString() ?? '70',
        'calories': dietInfo?.macronutrientGoals.calories.toString() ?? '1500',
      },
      'dietaryGoals': dietInfo?.dietaryGoals ?? 'Weight Loss',
      'activityLevel': dietInfo?.activityLevel ?? 'Moderately Active',
      'mealPreferences': dietInfo?.mealPreferences ?? 'Vegetarian',
    };
  }

  String _formatMonth(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }
}
