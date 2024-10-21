import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/auth_bloc.dart';
import 'package:fitfat/features/auth/presintation/wedgets/customs/custom_button.dart';
import 'package:fitfat/features/auth/presintation/wedgets/customs/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    String? email, password;

    GlobalKey<FormState> formKey = GlobalKey();

    bool isLoading = false;
    return BlocListener<AuthBloc, authState>(
      listener: (BuildContext context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSucess) {
          showSnackBar(context, 'Success');
          isLoading = false;
        } else if (state is RegisterFalier) {
          showSnackBar(context, state.errorMassage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: 'Name',
                        icon: FontAwesomeIcons.user,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
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
                      CustomTextField(
                        hint: 'Confirm Password',
                        icon: Icons.lock_outline,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      CustomBottom(
                        text: 'Sign Up',
                        ontap: () async {
                          if (formKey.currentState!.validate()) {
                            final siginUpEvent =
                                BlocProvider.of<AuthBloc>(context);
                            siginUpEvent.add(RegisterEvent(
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
      ),
    );
  }
}
