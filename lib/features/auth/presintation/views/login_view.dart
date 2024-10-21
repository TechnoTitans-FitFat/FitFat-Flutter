import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/auth_bloc.dart';
import 'package:fitfat/features/auth/presintation/wedgets/customs/custom_button.dart';
import 'package:fitfat/features/auth/presintation/wedgets/customs/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    String? email, password;

    GlobalKey<FormState> formKey = GlobalKey();

    bool isLoading = false;
    return BlocListener<AuthBloc, authState>(
      listener: (BuildContext context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucess) {
          showSnackBar(context, 'Success');
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
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      onchange: (data) {
                        password = data;
                      },
                      hint: 'Password',
                      icon: Icons.lock_outline,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomBottom(
                      text: 'Login',
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthBloc>(context).add(
                              LoginEvent(email: email!, password: password!));
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
}
