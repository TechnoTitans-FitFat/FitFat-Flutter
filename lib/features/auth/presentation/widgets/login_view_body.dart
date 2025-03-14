import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_button.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_textfield.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppLightColor.whiteColor),
              child: Form(
                key: context.read<LoginCubit>().signInFormKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextField(
                      controller: context.read<LoginCubit>().signInEmail,
                      hint: 'Email',
                      icon: Icons.email_outlined,
                      noti: 'please, Enter your email',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: context.read<LoginCubit>().signInPassword,
                      hint: 'Password',
                      icon: Icons.lock_outline,
                      sufIconNot: Icons.visibility_off,
                      sufIcon: Icons.visibility,
                      noti: 'Please, Enter your Password',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                        child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 55),
                          child: Text(
                            'Forgot password',
                            style: TextStyle(color: AppLightColor.greyColor),
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(
                      height: 32,
                    ),
                    // state is LoginLoading
                    //     ? const CircularProgressIndicator()
                    //     :
                    CustomBottom(
                      text: 'Sign In',
                      ontap: () {
                        if (context
                            .read<LoginCubit>()
                            .signInFormKey
                            .currentState!
                            .validate()) {
                          context.read<LoginCubit>().signIn();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            child: Divider(
                                color: AppLightColor.greyColor, height: 8),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Or signUp with'),
                          ),
                          SizedBox(
                            width: 80,
                            child: Divider(
                                color: AppLightColor.greyColor, height: 8),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SizedBox(
                                width: 25,
                                child: CircleAvatar(
                                  backgroundColor: AppLightColor.whiteColor,
                                  child: Assets.icons.google.image(),
                                ))),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.facebook,
                              color: Colors.blueAccent, size: 30),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.apple_outlined,
                              size: 40,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ) ;
  }
}