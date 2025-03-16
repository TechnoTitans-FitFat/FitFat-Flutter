import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_image_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginSignUp extends StatefulWidget {
  const LoginSignUp({super.key});

  @override
  State<LoginSignUp> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<LoginSignUp> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: const Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppLightColor.whiteColor,
          body: SafeArea(
              child: SingleChildScrollView(
            child: CustomImageAuth(),
          ))),
    );
  }
}
