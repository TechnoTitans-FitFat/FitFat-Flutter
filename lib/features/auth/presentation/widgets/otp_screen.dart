import 'package:fitfat/core/constants/light_colors.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:fitfat/features/auth/presentation/widgets/customs/enter_otpsent_to_text.dart';
import 'package:fitfat/features/registration_details/presentation/personal_information/presentation/views/personal_information_view.dart';
import 'package:fitfat/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'dart:async';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();
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

    if (email.isEmpty || userId.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid arguments received.")),
        );
        Get.back();
      });
    }

    startResendTimer();
  }

  void startResendTimer() {
    setState(() {
      enableResend = false;
      resendCountdown = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
    if (!enableResend) return;

    // Call resend OTP method from RegisterCubit
    context.read<RegisterCubit>().resendOtp(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppLightColor.whiteColor,
      body: BlocConsumer<RegisterCubit, SignUpStates>(
        listener: (context, state) {
          if (state is VerifyEmailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email Verified Successfully!"),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(
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
              padding: const EdgeInsets.all(55),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  Assets.images.verify.image(
                    height: MediaQuery.sizeOf(context).width * 0.5,
                    width: MediaQuery.sizeOf(context).width * 0.5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Email Verification",
                    style: AppStyles.textStyle22.copyWith(
                      color: AppLightColor.blackColor,
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
                    controller: textEditingController,
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
                      setState(() {
                        currentText = value;
                      });
                      verifyOtp();
                    },
                    onChanged: (value) {
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
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: state is VerifyEmailLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppLightColor.mainColor,
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
                                color: AppLightColor.whiteColor,
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
                          color: AppLightColor.greyColor,
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
                            color: AppLightColor.mainColor,
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

  void verifyOtp() {
    if (currentText.length != 6) {
      // Trigger shake animation on PinCodeTextField
      errorController!.add(ErrorAnimationType.shake);

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
}
