import 'package:equatable/equatable.dart';

class AccountSettingsState extends Equatable {
  final bool changePasswordExpanded;
  final bool isLoading;
  final bool loggedOut;
  final bool accountDeleted;
  final String errorMessage;
  final String successMessage; // Added success message
  final bool showOTPField;
  final bool otpVerified;

  const AccountSettingsState({
    this.changePasswordExpanded = false,
    this.isLoading = false,
    this.loggedOut = false,
    this.accountDeleted = false,
    this.errorMessage = '',
    this.successMessage = '', // Initialize success message
    this.showOTPField = false,
    this.otpVerified = false,
  });

  AccountSettingsState copyWith({
    bool? changePasswordExpanded,
    bool? isLoading,
    bool? loggedOut,
    bool? accountDeleted,
    String? errorMessage,
    String? successMessage, // Added to copyWith
    bool? showOTPField,
    bool? otpVerified,
  }) {
    return AccountSettingsState(
      changePasswordExpanded:
          changePasswordExpanded ?? this.changePasswordExpanded,
      isLoading: isLoading ?? this.isLoading,
      loggedOut: loggedOut ?? this.loggedOut,
      accountDeleted: accountDeleted ?? this.accountDeleted,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage:
          successMessage ?? this.successMessage, // Include in copyWith
      showOTPField: showOTPField ?? this.showOTPField,
      otpVerified: otpVerified ?? this.otpVerified,
    );
  }

  @override
  List<Object?> get props => [
        changePasswordExpanded,
        isLoading,
        loggedOut,
        accountDeleted,
        errorMessage,
        successMessage, // Add to props
        showOTPField,
        otpVerified,
      ];
}
