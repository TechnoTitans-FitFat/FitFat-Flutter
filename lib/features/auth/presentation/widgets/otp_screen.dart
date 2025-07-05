import 'dart:async';

import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/enter_otpsent_to_text.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/views/personal_information_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../gen/assets.gen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String currentText = "";
  String email = "";
  String userId = "";
  int resendCountdown = 60;
  Timer? _timer;
  bool enableResend = false;

  @override
  void initState() {
    super.initState();
    errorController = StreamController<ErrorAnimationType>();
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      email = args["email"] ?? "";
      userId = args["userId"] ?? "";
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (email.isEmpty || userId.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid arguments received.")),
        );
        Get.back();
        return;
      }
      startResendTimer();
    });
  }

  void startResendTimer() {
    if (!mounted) return;

    setState(() {
      enableResend = false;
      resendCountdown = 60;
    });

    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        if (resendCountdown > 0) {
          resendCountdown--;
        } else {
          enableResend = true;
          timer.cancel();
        }
      });
    });
  }

  void resendOtp() {
    if (!enableResend || !mounted) return;

    context.read<RegisterCubit>().resendOtp(email);
  }

  void verifyOtp() {
    if (!mounted) return;

    if (currentText.length != 6) {
      // Trigger shake animation on PinCodeTextField
      errorController?.add(ErrorAnimationType.shake);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a 6-digit OTP"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    context.read<RegisterCubit>().verifyEmail(email, currentText, userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.whiteColor,
      body: BlocConsumer<RegisterCubit, SignUpStates>(
        listener: (context, state) {
          if (!mounted) return;

          if (state is VerifyEmailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email Verified Successfully!"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PersonalInformationView(userId: userId)));
          } else if (state is VerifyEmailFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ResendOtpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage),
                backgroundColor: Colors.green,
              ),
            );
            // Restart the resend timer
            startResendTimer();
          } else if (state is ResendOtpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Assets.images.verify.image(
                    height: MediaQuery.of(context).size.width * 0.5,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Email Verification",
                    style: AppStyles.textStyle22.copyWith(
                      color: context.theme.blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  EnterOtpsentToText(email: email),
                  const SizedBox(height: 30),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: context.theme.whiteColor,
                      selectedFillColor: context.theme.backgroundColor,
                      activeColor: context.theme.blackColor,
                      selectedColor: context.theme.mainColor,
                      inactiveFillColor: context.theme.backgroundColor,
                      inactiveColor: context.theme.greyColor,
                    ),
                    cursorColor: context.theme.mainColor,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    textStyle: AppStyles.textStyle16.copyWith(
                      color: context.theme.blackColor,
                    ),
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (value) {
                      if (!mounted) return;
                      setState(() {
                        currentText = value;
                      });
                      verifyOtp();
                    },
                    onChanged: (value) {
                      if (!mounted) return;
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      return true;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: state is VerifyEmailLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.theme.mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8,
                                ),
                              ),
                            ),
                            onPressed:
                                currentText.length == 6 ? verifyOtp : null,
                            child: Text(
                              "Verify",
                              style: AppStyles.textStyle16.copyWith(
                                color: context.theme.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the code?",
                        style: AppStyles.textStyle13.copyWith(
                          color: context.theme.greyColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: state is! ResendOtpLoading && enableResend
                            ? resendOtp
                            : null,
                        child: Text(
                          state is ResendOtpLoading
                              ? "Resending..."
                              : (enableResend
                                  ? "Resend"
                                  : "Resend in ${resendCountdown}s"),
                          style: AppStyles.textStyle13.copyWith(
                            color: context.theme.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
