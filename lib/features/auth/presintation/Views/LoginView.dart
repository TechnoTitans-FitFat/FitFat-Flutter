import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/auth_bloc.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/Custom_Button.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/Custom_TextField.dart';
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
    return BlocListener<AuthBloc, authState>(
      listener: (BuildContext context, state) {
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
      child: ModalProgressHUD(
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
                            BlocProvider.of<AuthBloc>(context).add(
                                LoginEvent(
                                    email: email!, password: password!));
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
