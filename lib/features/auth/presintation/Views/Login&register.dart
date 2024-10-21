import 'package:fitfat/features/auth/presintation/Views/LoginView.dart';
import 'package:fitfat/features/auth/presintation/Wedgets/Customs/Custom_AnimatedToggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login_SignUp extends StatelessWidget {
  Login_SignUp({super.key});

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: CupertinoColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Image(
                image: AssetImage('imges/img.jpg'),
                width: double.infinity,
                fit: BoxFit.cover,
              )),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      AnimatedToggle(),
                      SizedBox(
                        height: 32,
                      ),
                      Login(),
                      SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Divider(color: Colors.grey, height: 8),
                          Text('Or signUp with:'),
                          Divider(color: Colors.grey, height: 8),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Container(width:25,child: CircleAvatar(child: Image(image: AssetImage('imges/google.png'),),backgroundColor: Colors.white,))),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.facebook,
                                color: Colors.blueAccent, size: 30),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.apple_outlined,
                                size: 40,
                              ))
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
