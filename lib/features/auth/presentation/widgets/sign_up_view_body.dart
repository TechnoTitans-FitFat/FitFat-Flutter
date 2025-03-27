import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_button.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_textfield.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/sign_up_with_google_divider_and_button.dart';
import 'package:fitfat/features/auth/presentation/widgets/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key, required this.tabController});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TabController tabController;
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
                key: _formKey,
                child: Column(
                  spacing: 18,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
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
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
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
                    state is SignUpLoading
                        ? const CircularProgressIndicator()
                        : CustomBottom(
                            text: 'Sign Up',
                            ontap: () async {
                              await cubit.signUp(context);
                              Navigator.push(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OtpScreen(),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SignUpWithGoogleDividerAndButton(tabController: tabController),
            ],
          ),
        );
      },
    );
  }
}
