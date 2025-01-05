// ignore_for_file: must_be_immutable

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../wedgets/customs/custom_button.dart';
import '../wedgets/customs/custom_textfield.dart';

class Login extends StatelessWidget {
  Login({super.key});

  late String? email, password;

  late GlobalKey<FormState> formKey = GlobalKey();

  late bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucess) {
          ShowDialog(context, 'Great to see you again');
          isLoading = false;
        } else if (state is LoginFalier) {
          showSnackBar(context, state.errorMassage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(
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
                    CustomTextField(
                      onchange: (data) {
                        email = data;
                      },
                      hint: 'Email',
                      icon: Icons.email_outlined,
                      noti: 'please, Enter your email',
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
                    CustomBottom(
                      text: 'Login',
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context)
                              .LoginUser(email: email!, password: password!);
                          return ShowDialog(context, 'Great to see you again');
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
                            padding: EdgeInsets.all(8.0),
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
                        IconButton(
                            onPressed: () {},
                            icon: const SizedBox(
                                width: 25,
                                child: CircleAvatar(
                                  backgroundColor: AppLightColor.whiteColor,
                                  child: Image(
                                    image: AssetImage('imges/google.png'),
                                  ),
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
        ),
      ),
    );
  }
}
