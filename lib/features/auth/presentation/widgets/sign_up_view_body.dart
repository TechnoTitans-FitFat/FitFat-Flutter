import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_button.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/custom_textfield.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        Form(
          key: context.read<RegisterCubit>().signUpFormKey,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                controller: context.read<RegisterCubit>().signUpName,
                hint: 'Name',
                icon: FontAwesomeIcons.user,
                noti: 'please, Enter your name',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: context.read<RegisterCubit>().signUpEmail,
                hint: 'Email',
                icon: Icons.email_outlined,
                noti: 'please , Enter your email',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: context.read<RegisterCubit>().signUpPassword,
                hint: 'Password',
                icon: Icons.lock_outline,
                sufIconNot: Icons.visibility_off,
                sufIcon: Icons.visibility,
                noti: 'please, Enter the password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: context.read<RegisterCubit>().confirmPassword,
                hint: 'Confirm Password',
                icon: Icons.lock_outline,
                sufIconNot: Icons.visibility_off,
                sufIcon: Icons.visibility,
                noti: 'please, confirm your password',
              ),
              const SizedBox(
                height: 32,
              ),
              CustomBottom(
                text: 'Sign Up',
                ontap: () async {
                  if (context
                      .read<RegisterCubit>()
                      .signUpFormKey
                      .currentState!
                      .validate()) {
                    context.read<RegisterCubit>().signUp();
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
                      child:
                          Divider(color: AppLightColor.greyColor, height: 8),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8, top: 8),
                      child: Text('Or signUp with'),
                    ),
                    SizedBox(
                      width: 80,
                      child:
                          Divider(color: AppLightColor.greyColor, height: 8),
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
                  GestureDetector(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircleAvatar(
                        backgroundColor: AppLightColor.whiteColor,
                        child: Assets.icons.google.image()
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: const Icon(Icons.facebook,
                        color: Colors.blueAccent, size: 27),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: const Icon(
                      Icons.apple_outlined,
                      size: 35,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
