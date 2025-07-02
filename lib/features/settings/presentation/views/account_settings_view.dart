import 'package:fitfat/core/api/dio_comsumer.dart';
import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/auth/presentation/views/login_and_register_view.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:fitfat/features/forget_password/presentation/cubit/forget_password_state.dart';
import 'package:fitfat/features/settings/data/settings_cubit/account_settings_cubit.dart';
import 'package:fitfat/features/settings/data/settings_cubit/account_settings_state.dart';
import 'package:fitfat/features/settings/presentation/widgets/change_password_widget.dart';
import 'package:fitfat/features/settings/presentation/widgets/custom_dialog.dart';
import 'package:fitfat/features/settings/presentation/widgets/custom_list_tile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AccountSettingsCubit, AccountSettingsState>(
          listener: (context, state) {
            if (state.loggedOut) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginSignUp(DioComsumer),
                ),
              );
            }
            if (state.accountDeleted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginSignUp(DioComsumer),
                ),
              );
            }

            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
              context.read<AccountSettingsCubit>().clearMessages();
            }

            if (state.successMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.successMessage)),
              );
              context.read<AccountSettingsCubit>().clearMessages();
            }
          },
        ),
        BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            switch (state.status) {
              case ForgotPasswordStatus.otpSent:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('OTP sent to your email')),
                );
                break;
              case ForgotPasswordStatus.otpVerified:
                context.read<AccountSettingsCubit>().setOtpVerified(true);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('OTP verified successfully')),
                );
                break;
              case ForgotPasswordStatus.resetSuccess:
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Password reset successfully')),
                );
                context
                    .read<AccountSettingsCubit>()
                    .toggleChangePasswordExpanded();
                break;
              case ForgotPasswordStatus.error:
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(state.errorMessage ?? 'An error occurred')),
                );
                break;
              default:
                break;
            }
          },
        ),
      ],
      child: BlocBuilder<AccountSettingsCubit, AccountSettingsState>(
        builder: (context, state) {
          final cubit = context.read<AccountSettingsCubit>();
          final forgotPasswordState =
              context.watch<ForgotPasswordCubit>().state;

          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.theme.secondColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.red
                                    ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              const SizedBox(width: 16),
                              const Text(
                                'Account Settings',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (state.isLoading ||
                            forgotPasswordState.status ==
                                ForgotPasswordStatus.loading)
                          const Center(
                              child:
                                  CircularProgressIndicator(color: Colors.red)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ChangePasswordWidget(
                            isExpanded: state.changePasswordExpanded,
                            onExpand: () {
                              cubit.toggleChangePasswordExpanded();
                            },
                            newPasswordController: cubit.newPasswordController,
                            confirmPasswordController:
                                cubit.confirmPasswordController,
                            otpController: cubit.otpController,
                            onSave: () {
                              // Ensure passwords match before submitting
                              if (cubit.newPasswordController.text !=
                                  cubit.confirmPasswordController.text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Passwords do not match')),
                                );
                                return;
                              }

                              if (cubit.newPasswordController.text.length < 6) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Password must be at least 6 characters')),
                                );
                                return;
                              }

                              context.read<ForgotPasswordCubit>().resetPassword(
                                  cubit.newPasswordController.text,
                                  cubit.confirmPasswordController.text);
                            },
                            onVerifyOTP: () {
                              final otp = cubit.otpController.text;
                              if (otp.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please enter the OTP code')),
                                );
                                return;
                              }
                              context
                                  .read<ForgotPasswordCubit>()
                                  .verifyOtp(otp);
                            },
                            showOTPField: state.showOTPField,
                            otpVerified: state.otpVerified,
                            onConfirmChange: () {
                              cubit.showOTPField();
                              final email =
                                  context.read<LoginCubit>().user!.email;
                              print("Sending OTP to email: $email");
                              // Send OTP to user's email
                              context
                                  .read<ForgotPasswordCubit>()
                                  .sendPasswordResetOtp(email);
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomListTileButton(
                            icon: Icons.logout,
                            title: 'Log Out',
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialog(
                                    action: "Log Out",
                                    title: "Log Out",
                                    subtitle:
                                        "Are you sure you want to log out?",
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      cubit.logout(context
                                          .read<LoginCubit>()
                                          .user!
                                          .token);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomListTileButton(
                            icon: Icons.delete_outline,
                            title: 'Delete Account',
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialog(
                                    action: "Delete",
                                    title: "Delete Account",
                                    subtitle:
                                        "Are you sure you want to delete your account?",
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      cubit.deleteAccount(context
                                          .read<LoginCubit>()
                                          .user!
                                          .token);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
