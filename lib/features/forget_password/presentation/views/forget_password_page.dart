import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:fitfat/features/forget_password/presentation/views/widgets/email_page.dart'
    show EmailPage;
import 'package:fitfat/features/forget_password/presentation/views/widgets/otp_page.dart';
import 'package:fitfat/features/forget_password/presentation/views/widgets/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordFlow extends StatefulWidget {
  const ForgotPasswordFlow({super.key});

  @override
  State<ForgotPasswordFlow> createState() => _ForgotPasswordFlowState();
}

class _ForgotPasswordFlowState extends State<ForgotPasswordFlow> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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

        if (state.status == ForgotPasswordStatus.otpSent) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OtpPage(
                otpController: _otpController,
                email: _emailController.text,
              ),
            ),
          );
        }

        if (state.status == ForgotPasswordStatus.otpVerified) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(
                newPasswordController: _newPasswordController,
                confirmPasswordController: _confirmPasswordController,
              ),
            ),
          );
        }

        if (state.status == ForgotPasswordStatus.resetSuccess) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              context,
              "Success",
              'Password reset successfully! Please login with your new password.',
              SnackBarType.success,
            ),
          );
          context.read<ForgotPasswordCubit>().resetState();
        }
      },
      child: EmailPage(emailController: _emailController),
    );
  }
}
