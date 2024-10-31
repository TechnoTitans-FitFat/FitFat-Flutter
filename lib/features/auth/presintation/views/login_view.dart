import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/Custom_Button.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/Custom_TextField.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/snack_bar.dart';
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
    return BlocListener<LoginCubit, LoginStates>(
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
                    const SizedBox(height: 32,),
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 100,child: const Divider(color: Colors.grey, height: 8),),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Or signUp with'),
                          ),
                          Container(width: 100,child: const Divider(color: Colors.grey, height: 8),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const SizedBox(
                                width: 25,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
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