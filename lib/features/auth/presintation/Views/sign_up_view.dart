import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_button.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatelessWidget {
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSucess) {
          ShowSnackBar(context, 'Success');
          isLoading = false;
        } else if (state is SignUpFalier) {
          ShowSnackBar(context, state.errorMassage);
          isLoading = false;
        }
      },
      builder: (BuildContext context, SignUpStates state)=>ModalProgressHUD(
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
                      hint: 'Name',
                      icon: FontAwesomeIcons.user,
                    ),
                    SizedBox(
                      height: 16,
                    ),
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
                    CustomTextField(
                      hint: 'Confirm Password',
                      icon: Icons.lock_outline,
                      sufIcon: Icons.visibility,
                      sufIconNot: Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomBottom(
                      text: 'Sign Up',
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          final SiginUpEvent =
                              BlocProvider.of<SignUpCubit>(context);
                          SiginUpEvent.SignupUser(email: email!, password: password!);
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