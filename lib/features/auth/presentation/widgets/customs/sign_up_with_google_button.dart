import 'package:dio/dio.dart';
import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpWithGoogleButton extends StatelessWidget {
  const SignUpWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 45,
        vertical: 10,
      ),
      child: ElevatedButton(
        onPressed: () async {
          try {
            final GoogleSignInAccount? googleUser = await LoginApi.login();

            // Null-aware access to authentication
            final idToken = await googleUser?.authentication;

            if (idToken?.idToken case String token) {
              final result = await LoginApi.sendGoogleTokenToBackend(token);

              if (result.isSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Sign In Successful"),
                    backgroundColor: Colors.green,
                  ),
                );

                // Null-coalescing for default values
                final String userToken = result.data?['token'] ?? 'No token';
                final String? userEmail = googleUser?.email;
                final String? userName = googleUser?.displayName;

                print('Received token: $userToken');
                print('User email: $userEmail');
                print('User name: $userName');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("Authentication Error: ${result.errorMessage}"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            } else {
              throw Exception('Failed to obtain ID token');
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Sign In Failed: ${e.toString()}"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(
            AppLightColor.whiteColor,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: AppLightColor.greyColor,
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
              const SizedBox(
                height: 15,
                width: 15,
                child: CircleAvatar(
                  backgroundColor: AppLightColor.whiteColor,
                  child: Image(
                    image: AssetImage('assets/icons/google.png'),
                  ),
                ),
              ),
              Text(
                "Sign in with Google",
                style: AppStyles.textStyle13.copyWith(
                  color: AppLightColor.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginApi {
  static final _googleSignIn = GoogleSignIn();
  static final Dio _dio = Dio();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future<ApiResult> sendGoogleTokenToBackend(String idToken) async {
    try {
      final response = await _dio.get(
        'https://fitfat-backend.up.railway.app/auth/google',
        queryParameters: {'token': idToken},
      );

      return ApiResult.success(response.data);
    } on DioException catch (e) {
      return ApiResult.failure(e.response?.data?['message'] ??
          e.message ??
          'Unknown authentication error');
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}

// Simple wrapper class for API results
class ApiResult {
  final bool isSuccess;
  final Map<String, dynamic>? data;
  final String? errorMessage;

  ApiResult._({
    required this.isSuccess,
    this.data,
    this.errorMessage,
  });

  factory ApiResult.success(Map<String, dynamic> data) {
    return ApiResult._(
      isSuccess: true,
      data: data,
    );
  }

  factory ApiResult.failure(String message) {
    return ApiResult._(
      isSuccess: false,
      errorMessage: message,
    );
  }
}
