import 'dart:math';

import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/main/presentaion/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpWithGoogleButton extends StatefulWidget {
  const SignUpWithGoogleButton({super.key});

  @override
  State<SignUpWithGoogleButton> createState() => _SignUpWithGoogleButtonState();
}

class _SignUpWithGoogleButtonState extends State<SignUpWithGoogleButton> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  bool _isLoading = false;

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // User successfully signed in
        print('Google Sign-In successful!');
        print('Email: ${googleUser.email}');
        print('Name: ${googleUser.displayName}');
        print('Photo: ${googleUser.photoUrl}');

        // Navigate to main screen
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ));
        // Show success message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Welcome ${googleUser.displayName}!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        print('Google Sign-In was cancelled by user');
      }
    } catch (error) {
      print('Google Sign-In Error: $error');

      // Show error message to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            context,
            "Error",
            "Sign-in failed",
            SnackBarType.success,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 45,
        vertical: 10,
      ),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleGoogleSignIn,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            context.theme.whiteColor,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: context.theme.greyColor,
                width: 1,
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isLoading)
                SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      context.theme.greyColor,
                    ),
                  ),
                )
              else
                SizedBox(
                  height: 15,
                  width: 15,
                  child: CircleAvatar(
                    backgroundColor: context.theme.whiteColor,
                    child: const Image(
                      image: AssetImage('assets/icons/google.png'),
                    ),
                  ),
                ),
              Text(
                _isLoading ? "Signing in..." : "Sign in with Google",
                style: AppStyles.textStyle13.copyWith(
                  color: context.theme.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
