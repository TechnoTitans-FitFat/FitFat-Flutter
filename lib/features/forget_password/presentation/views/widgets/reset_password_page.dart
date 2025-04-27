import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:fitfat/gen/assets.gen.dart';

class ResetPasswordPage extends StatefulWidget {
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;

  const ResetPasswordPage({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.resetSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset successfully'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate to login screen
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginSignUp(DioComsumer)),
            (route) => false,
          );
        } else if (state.status == ForgotPasswordStatus.error) {
          // Add this condition to handle error status
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'password mast have Capital letters "A-Z" and Small letter "a-z" and Special Character'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppLightColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppLightColor.backgroundColor,
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
                    child: Assets.images.resetPassword
                        .image(height: 100, width: 100),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Your New Password Must Be Different from Previously Used Password",
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle15.copyWith(
                        color: AppLightColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "New Password",
                        style: AppStyles.textStyle15.copyWith(
                          color: AppLightColor.greyColor1,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextFormField(
                        controller: widget.newPasswordController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          hintStyle: AppStyles.textStyle12Light.copyWith(
                            color: AppLightColor.greyColor,
                          ),
                          focusColor: AppLightColor.mainColor,
                          hintText: "Enter your new password",
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppLightColor.mainColor,
                            ),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppLightColor.mainColor,
                            ),
                          ),
                        ),
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a new password';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm Password",
                        style: AppStyles.textStyle15.copyWith(
                          color: AppLightColor.greyColor1,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextFormField(
                        controller: widget.confirmPasswordController,
                        decoration: InputDecoration(
                          hintStyle: AppStyles.textStyle12Light.copyWith(
                            color: AppLightColor.greyColor,
                          ),
                          focusColor: AppLightColor.mainColor,
                          hintText: "Confirm your new password",
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppLightColor.mainColor,
                            ),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppLightColor.mainColor,
                            ),
                          ),
                        ),
                        obscureText: _obscurePassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != widget.newPasswordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppLightColor.mainColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ForgotPasswordCubit>().resetPassword(
                                widget.newPasswordController.text.trim(),
                                widget.confirmPasswordController.text.trim(),
                              );
                        }
                      },
                      child: Text(
                        'Reset Password',
                        style: AppStyles.textStyle16.copyWith(
                          color: AppLightColor.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
