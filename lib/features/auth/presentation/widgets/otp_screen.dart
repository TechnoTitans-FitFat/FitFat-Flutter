import 'package:fitfat/core/constants/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/sign_up_cubit.dart';
import 'dart:async';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late List<TextEditingController> otpControllers;
  late List<FocusNode> focusNodes;

  String email = "";
  String userId = "";
  int resendCountdown = 60;
  Timer? _timer;
  bool enableResend = false;

  @override
  void initState() {
    super.initState();

    otpControllers = List.generate(6, (index) => TextEditingController());
    focusNodes = List.generate(6, (index) => FocusNode());

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

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get completeOtp =>
      otpControllers.map((controller) => controller.text).join();

  void verifyOtp() {
    final otp = completeOtp;
    if (otp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a 6-digit OTP")),
      );
      return;
    }

    context.read<RegisterCubit>().verifyEmail(email, otp, userId);
  }

  void resendOtp() {
    if (!enableResend) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("OTP resent successfully")),
    );
    startResendTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
        elevation: 0,
        backgroundColor: AppLightColor.mainColor,
        foregroundColor: Colors.white,
      ),
      body: BlocConsumer<RegisterCubit, SignUpStates>(
        listener: (context, state) {
          if (state is VerifyEmailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email Verified Successfully!"),
                backgroundColor: Colors.green,
              ),
            );
            Get.offNamed('/homeScreen');
          } else if (state is VerifyEmailFailure) {
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
            onTap: () => FocusScope.of(context).unfocus(), // Hide keyboard on tap
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(20.0), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Icon(
                    Icons.mark_email_read,
                    size: 70,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Email Verification",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    email.isNotEmpty
                        ? "We've sent a 6-digit code to $email"
                        : "Error: No email provided!",
                    style: TextStyle(
                      color: email.isNotEmpty ? Colors.black87 : Colors.red,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  
                  // OTP Fields
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      6,
                      (index) => SizedBox(
                        width: 40,
                        child: TextField(
                          controller: otpControllers[index],
                          focusNode: focusNodes[index],
                          keyboardType: TextInputType.number, 
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: const InputDecoration(counterText: ""),
                          autofocus: index == 0, // Auto-focus the first field
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              focusNodes[index + 1].requestFocus();
                            } 
                            if (index == 5 && completeOtp.length == 6) {
                              verifyOtp();
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Verify Button
                  SizedBox(
                    height: 50,
                    child: state is VerifyEmailLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: verifyOtp,
                            child: const Text("Verify",
                                style: TextStyle(fontSize: 16)),
                          ),
                  ),
                  const SizedBox(height: 20),

                  // Resend OTP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive the code? "),
                      TextButton(
                        onPressed: enableResend ? resendOtp : null,
                        child: Text(enableResend
                            ? "Resend"
                            : "Resend in ${resendCountdown}s"),
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
