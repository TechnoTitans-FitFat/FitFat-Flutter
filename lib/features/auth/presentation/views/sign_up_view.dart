import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/wedgets/customs/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../wedgets/customs/custom_textfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    String? email, password;

    GlobalKey<FormState> formKey = GlobalKey();

    bool isLoading = false;
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (BuildContext context, state) {
        if (state is SignUpLoading) {
          isLoading = false;
        } else if (state is SignUpSucess) {
          ShowDialog(
              context, 'Welcome to the family!\n Your journey starts now');
          isLoading = false;
        } else if (state is SignUpFalier) {
          showSnackBar(context, state.errorMassage);
          isLoading = false;
        }
      },
      builder: (BuildContext context, SignUpStates state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: AppLightColor.whiteColor,
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppLightColor.whiteColor),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      const CustomTextField(
                        hint: 'Name',
                        icon: FontAwesomeIcons.user,
                        noti: 'please, Enter your name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        onchange: (data) {
                          email = data;
                        },
                        hint: 'Email',
                        icon: Icons.email_outlined,
                        noti: 'please , Enter your email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        onchange: (data) {
                          password = data;
                        },
                        hint: 'Password',
                        icon: Icons.lock_outline,
                        sufIconNot: Icons.visibility,
                        sufIcon: Icons.visibility_off,
                        noti: 'please, Enter the password',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTextField(
                        hint: 'Confirm Password',
                        icon: Icons.lock_outline,
                        sufIconNot: Icons.visibility,
                        sufIcon: Icons.visibility_off,
                        noti: 'please, confirm your password',
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      CustomBottom(
                        text: 'Sign Up',
                        ontap: () async {
                          if (formKey.currentState!.validate()) {
                            final siginUpEvent =
                                BlocProvider.of<SignUpCubit>(context);
                            siginUpEvent.SignupUser(
                                email: email!, password: password!);
                            return ShowDialog(context,
                                'Welcome to the family!\n Your journey starts now');
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
                              width: 100,
                              child: Divider(
                                  color: AppLightColor.greyColor, height: 8),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 8, left: 8, top: 8),
                              child: Text('Or signUp with'),
                            ),
                            SizedBox(
                              width: 100,
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
                          GestureDetector(
                            child: const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircleAvatar(
                                backgroundColor: AppLightColor.whiteColor,
                                child: Image(
                                  image: AssetImage('imges/google.png'),
                                ),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
