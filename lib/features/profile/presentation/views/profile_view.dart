import 'package:fitfat/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:fitfat/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFBE0E2),
      body: ProfileViewBody(),
      //bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
