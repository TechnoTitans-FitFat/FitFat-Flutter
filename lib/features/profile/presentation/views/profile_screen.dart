import 'package:fitfat/features/profile/presentation/widgets/general_settings_section.dart';
import 'package:fitfat/features/profile/presentation/widgets/profile_heder.dart';
import 'package:fitfat/features/profile/presentation/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import '../../../auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import '../cubit/profile_cubit/profile_cubit.dart';
import '../cubit/profile_cubit/profile_state.dart';

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
    final token =
        BlocProvider.of<LoginCubit>(context, listen: false).user?.token;
    if (token != null) {
      BlocProvider.of<UserProfileCubit>(context).getUserProfile(token: token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.secondColor,
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
                    ),
                    const SizedBox(height: 20),
                    GeneralSettingsSection(
                        context: context, isDarkMode: isDarkMode),
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
}
