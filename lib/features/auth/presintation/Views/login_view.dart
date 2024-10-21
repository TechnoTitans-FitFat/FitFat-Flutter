import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_button.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatelessWidget {
  Login({super.key});

  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucess) {
          ShowSnackBar(context, 'Success');
          isLoading = false;
        } else if (state is LoginFalier) {
          ShowSnackBar(context, state.errorMassage);
          isLoading = false;
        }
      },
      builder: (context,state)=>ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      onchange: (data) {
                        email = data;
                      },
                      hint: 'Email',
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      onchange: (data) {
                        password = data;
                      },
                      hint: 'Password',
                      icon: Icons.lock_outline,
                      sufIcon: Icons.visibility,
                      sufIconNot: Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomBottom(
                      text: 'Login',
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).LoginUser(email: email!, password: password!);
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void ShowSnackBar(BuildContext context, massage) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(massage)));
  }
}
