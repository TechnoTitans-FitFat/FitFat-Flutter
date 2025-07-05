// email_page.dart

import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:fitfat/features/forget_password/presentation/views/widgets/email_with_field.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPage extends StatefulWidget {
  final TextEditingController emailController;

  const EmailPage({super.key, required this.emailController});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.5,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child: Assets.images.password.image(height: 100, width: 100),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Please Enter Your Email Address To Receive a Verification Code",
                    style: AppStyles.textStyle15.copyWith(
                      color: context.theme.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                EmailWithField(
                  emailController: widget.emailController,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.theme.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<ForgotPasswordCubit>().sendPasswordResetOtp(
                          widget.emailController.text.trim());
                    }
                  },
                  child: Text(
                    "Send OTP Code",
                    style: AppStyles.textStyle16.copyWith(
                      color: context.theme.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
