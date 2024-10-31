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
          backgroundColor:Colors.white,
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
                      const SizedBox(height: 32,),
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
                        sufIconNot: Icons.visibility_off,
                        sufIcon:Icons.visibility ,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hint: 'Confirm Password',
                        icon: Icons.lock_outline,
                        sufIconNot: Icons.visibility_off,
                        sufIcon:Icons.visibility ,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(width: 100,child: const Divider(color: Colors.grey, height: 8),),
                            const Padding(
                              padding: EdgeInsets.only(right: 8, left: 8,top: 8),
                              child: Text('Or signUp with'),
                            ),
                            Container(width: 100,child: const Divider(color: Colors.grey, height: 8),),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Container(
                                  height: 20,
                                  width: 20,
                                  child: const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Image(
                                          image: AssetImage('imges/google.png'),
                                        ),
                                      ),
                                ),
                          ),
                          SizedBox(width: 20,),
                            GestureDetector(
                              child: Icon(Icons.facebook,
                                  color: Colors.blueAccent, size: 27),
                            ),
                          SizedBox(width: 20,),
                          GestureDetector(
                            child: Icon(
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