import 'package:fitfat/features/auth/presintation/wedgets/customs/custom_animated_toggle.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    bool isLoading = false;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(child:
            Stack(children: [
              Positioned(top:0,left:0,right:0,child: Image(
                image: AssetImage('imges/img.jpg'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),),
              Positioned(top: 200,left: 0,right: 0,bottom:0,child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const AnimatedToggle(),
                      ],
                    ),
                  ),
                ),
              ),)
            ],)
        )
      ),
    );
  }
}