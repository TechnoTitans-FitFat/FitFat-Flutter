import 'package:fitfat/features/main/presentaion/views/viewsBody/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBE0E2),
      body: ProfileViewBody(),
    );
  }
}