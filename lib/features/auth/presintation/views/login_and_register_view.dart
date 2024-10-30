import 'package:fitfat/features/auth/presintation/wedgets/customs/custom_animated_toggle.dart';
import 'package:flutter/cupertino.dart';
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                image: AssetImage('imges/img.jpg'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const AnimatedToggle(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              child:
                                  const Divider(color: Colors.grey, height: 8),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Or signUp with'),
                            ),
                            Container(
                              width: 100,
                              child:
                                  const Divider(color: Colors.grey, height: 8),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
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
      ),
    );
  }
}