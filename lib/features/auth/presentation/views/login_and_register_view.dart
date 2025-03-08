import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_animated_toggle.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_image_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: const Scaffold(
          backgroundColor: AppLightColor.whiteColor,
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomImageAuth(),
                    
                  ],
                ),
              ))),
    );
  }
}
