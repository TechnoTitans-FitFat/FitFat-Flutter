import 'package:fitfat/core/extensions/context_color_extension.dart';
import 'package:fitfat/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ChangePasswordWidget extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onExpand;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController otpController;
  final VoidCallback onSave;
  final VoidCallback onVerifyOTP;
  final VoidCallback onConfirmChange;
  final VoidCallback? onCancel;
  final bool showOTPField;
  final bool otpVerified;

  const ChangePasswordWidget({
    Key? key,
    required this.isExpanded,
    required this.onExpand,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.otpController,
    required this.onSave,
    required this.onVerifyOTP,
    required this.onConfirmChange,
    this.onCancel,
    required this.showOTPField,
    required this.otpVerified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onExpand,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.lock, color: context.theme.mainColor),
                  const SizedBox(width: 16),
                  Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.theme.blackColor),
                  ),
                  const Spacer(),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: context.theme.greyColor1,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!showOTPField) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onConfirmChange,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Yes, I want to change my password'),
                      ),
                    ),
                  ],
                  if (showOTPField && !otpVerified) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Enter verification code',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      style: AppStyles.textStyle16.copyWith(
                        color: context.theme.blackColor,
                      ),
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: context.theme.backgroundColor,
                        hintText: 'Enter the code sent to your email',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onVerifyOTP,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Verify Code'),
                          ),
                        ),
                        if (onCancel != null) ...[
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onCancel,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                  if (showOTPField && otpVerified) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'New password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      style: AppStyles.textStyle16.copyWith(
                        color: context.theme.blackColor,
                      ),
                      controller: newPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: context.theme.backgroundColor,
                        hintText: 'Enter new password',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Confirm password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      style: AppStyles.textStyle16.copyWith(
                        color: context.theme.blackColor,
                      ),
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: context.theme.backgroundColor,
                        hintText: 'Confirm new password',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: onSave,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Save Change'),
                          ),
                        ),
                        if (onCancel != null) ...[
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onCancel,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
