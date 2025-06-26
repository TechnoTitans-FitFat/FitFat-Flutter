import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_button.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_textfield.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/sign_up_with_google_divider_and_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key, required this.tabController});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TabController tabController;

  // Name validator
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  // Email validator
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Password validator
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(value);
    final hasLowercase = RegExp(r'[a-z]').hasMatch(value);
    final hasDigits = RegExp(r'[0-9]').hasMatch(value);
    final hasSpecialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
    if (!hasUppercase || !hasLowercase || !hasDigits || !hasSpecialChars) {
      return 'Password must include uppercase, lowercase, numbers, and special characters';
    }
    return null;
  }

  // Confirm password validator
  String? _validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpFalier) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMassage.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();

        return SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  spacing: 10,
                  children: [
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: cubit.signUpName,
                      hint: 'Name',
                      icon: FontAwesomeIcons.user,
                      noti: 'Please enter your name',
                      validator: _validateName,
                    ),
                    CustomTextField(
                      controller: cubit.signUpEmail,
                      hint: 'Email',
                      icon: Icons.email_outlined,
                      noti: 'Please enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: _validateEmail,
                    ),
                    CustomTextField(
                      controller: cubit.signUpPassword,
                      hint: 'Password',
                      icon: Icons.lock_outline,
                      sufIconNot: Icons.visibility_off,
                      sufIcon: Icons.visibility,
                      noti: 'Please enter your password',
                      validator: _validatePassword,
                      // Removed obscureText: true to allow internal toggle logic
                    ),
                    CustomTextField(
                      controller: cubit.confirmPassword,
                      hint: 'Confirm Password',
                      icon: Icons.lock_outline,
                      sufIconNot: Icons.visibility_off,
                      sufIcon: Icons.visibility,
                      noti: 'Please confirm your password',
                      validator: (value) => _validateConfirmPassword(
                          value, cubit.signUpPassword.text),
                      // Removed obscureText: true to allow internal toggle logic
                    ),
                    const SizedBox(height: 8),
                    state is SignUpLoading
                        ? const CustomBottom(
                            isLoading: true,
                          )
                        : CustomBottom(
                            isLoading: false,
                            text: 'Sign Up',
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                await cubit.signUp(context);
                                cubit.reset();
                              }
                            },
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SignUpWithGoogleDividerAndButton(tabController: tabController),
            ],
          ),
        );
      },
    );
  }
}
