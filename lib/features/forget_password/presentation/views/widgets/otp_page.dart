import 'dart:async';

import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:fitfat/features/forget_password/presentation/views/widgets/reset_password_page.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  final TextEditingController otpController;
  final String email;
  const OtpPage({super.key, required this.otpController, required this.email});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>.broadcast();
  }

  @override
  void dispose() {
    errorController.close();
    // Do NOT dispose the widget.otpController here as it's managed by the parent
    super.dispose();
  }

  void verifyOtp() {
    if (widget.otpController.text.length == 6) {
      context.read<ForgotPasswordCubit>().verifyOtp(widget.otpController.text);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.error) {
          _showErrorDialog(state.errorMessage ?? 'An error occurred');
        }
        if (state.status == ForgotPasswordStatus.otpVerified) {
          // Create new controllers for reset password
          final TextEditingController newPasswordController =
              TextEditingController();
          final TextEditingController confirmPasswordController =
              TextEditingController();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(
                newPasswordController: newPasswordController,
                confirmPasswordController: confirmPasswordController,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppLightColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppLightColor.backgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.5,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  child:
                      Assets.images.checkEmail.image(height: 100, width: 100),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Please Enter The Code Sent To",
                    style: AppStyles.textStyle15.copyWith(
                      color: AppLightColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.email,
                    style: AppStyles.textStyle15.copyWith(
                      color: AppLightColor.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: AppLightColor.whiteColor,
                      selectedFillColor: AppLightColor.backgroundColor,
                      activeColor: AppLightColor.blackColor,
                      selectedColor: AppLightColor.mainColor,
                      inactiveFillColor: AppLightColor.backgroundColor,
                      inactiveColor: AppLightColor.greyColor,
                    ),
                    cursorColor: AppLightColor.mainColor,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: widget.otpController,
                    keyboardType: TextInputType.number,
                    textStyle: AppStyles.textStyle16.copyWith(
                      color: AppLightColor.blackColor,
                    ),
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (value) {
                      verifyOtp();
                    },
                    onChanged: (value) {
                      // We don't need to update a separate state variable
                      // since we're using the controller directly
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      return true;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                  builder: (context, state) {
                    final isLoading =
                        state.status == ForgotPasswordStatus.loading;

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppLightColor.mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(
                            double.infinity, 50), // Ensure consistent height
                      ),
                      onPressed: isLoading
                          ? null // Disable button when loading
                          : () {
                              if (widget.otpController.text.length == 6) {
                                verifyOtp();
                              } else {
                                errorController.add(ErrorAnimationType.shake);
                              }
                            },
                      child: isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: AppLightColor.whiteColor,
                                strokeWidth: 3,
                              ),
                            )
                          : Text(
                              'Verify OTP',
                              style: AppStyles.textStyle16.copyWith(
                                color: AppLightColor.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                // Removed the separate progress indicator since we now have it in the button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
