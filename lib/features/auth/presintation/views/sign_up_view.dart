import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_textField.dart';
import 'package:fitfat/features/auth/presintation/wedgets/customs/custom_button.dart';
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
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (BuildContext context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSucess) {
          showSnackBar(context, 'Success');
          isLoading = false;
        } else if (state is SignUpFalier) {
          showSnackBar(context, state.errorMassage);
          isLoading = false;
        }
      },
      builder: (BuildContext context, SignUpStates state)=>ModalProgressHUD(
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
                      SizedBox(height: 32,),
                      CustomTextField(
                        hint: 'Name',
                        icon: FontAwesomeIcons.user,
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
                      ),
                      const SizedBox(
                        height: 20,
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
                                BlocProvider.of<SignUpCubit>(context);
                            siginUpEvent.SignupUser(email: email!, password: password!);
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