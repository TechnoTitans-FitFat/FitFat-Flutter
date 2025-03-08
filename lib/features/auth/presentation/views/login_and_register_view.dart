import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_animated_toggle.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          backgroundColor: AppLightColor.whiteColor,
          body: SafeArea(
              child: Stack(
            children: [
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image(
                  image: AssetImage('imges/img.jpg'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppLightColor.whiteColor),
                  child: Form(
                    key: formKey,
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          AnimatedToggle(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ))),
    );
  }
}
