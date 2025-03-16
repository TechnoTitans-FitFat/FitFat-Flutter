import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_button.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_textfield.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SignUpViewBody extends StatelessWidget {
  
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpFalier) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMassage.toString()),
              backgroundColor: Colors.red,
            ),
          );
        }
        
        // No need to handle navigation here as it's handled in the cubit
      },
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        
        return SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: cubit.signUpFormKey,
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    
                    // Name Field
                    CustomTextField(
                      controller: cubit.signUpName,
                      hint: 'Name',
                      icon: FontAwesomeIcons.user,
                      noti: 'Please enter your name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Email Field
                    CustomTextField(
                      controller: cubit.signUpEmail,
                      hint: 'Email',
                      icon: Icons.email_outlined,
                      noti: 'Please enter your email',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Password Field
                    CustomTextField(
                      controller: cubit.signUpPassword,
                      hint: 'Password',
                      icon: Icons.lock_outline,
                      sufIconNot: Icons.visibility_off,
                      sufIcon: Icons.visibility,
                      noti: 'Please enter the password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    
                    // Confirm Password Field
                    CustomTextField(
                      controller: cubit.confirmPassword,
                      hint: 'Confirm Password',
                      icon: Icons.lock_outline,
                      sufIconNot: Icons.visibility_off,
                      sufIcon: Icons.visibility,
                      noti: 'Please confirm your password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != cubit.signUpPassword.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 32),
                    
                    // Sign Up Button
                    state is SignUpLoading
                      ? const CircularProgressIndicator()
                      : CustomBottom(
                          text: 'Sign Up',
                          ontap: () async {
                            // The navigation is now handled in the cubit
                            await cubit.signUp(context);
                          },
                        ),
                    const SizedBox(height: 16),
                    
                    // Or sign up with
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Divider(color: AppLightColor.greyColor, height: 8),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8, left: 8, top: 8),
                            child: Text('Or sign up with'),
                          ),
                          SizedBox(
                            width: 80,
                            child: Divider(color: AppLightColor.greyColor, height: 8),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Social Media Sign Up Options
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Google sign up logic
                          },
                          child: const SizedBox(
                            height: 26,
                            width: 26,
                            child: CircleAvatar(
                              backgroundColor: AppLightColor.whiteColor,
                              child: Image(
                                image: AssetImage('assets/icons/google.png'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            // Facebook sign up logic
                          },
                          child: const Icon(Icons.facebook,
                              color: Colors.blueAccent, size: 27),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            // Apple sign up logic
                          },
                          child: const Icon(
                            Icons.apple_outlined,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // Already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () => Get.offNamed('/loginScreen'),
                          child: const Text("Login"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}