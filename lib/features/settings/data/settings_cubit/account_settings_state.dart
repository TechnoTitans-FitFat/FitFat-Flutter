import 'package:equatable/equatable.dart';

class AccountSettingsState extends Equatable {
  final bool changePasswordExpanded;
  final bool isLoading;
  final String? errorMessage;
  final bool loggedOut;
  final bool accountDeleted;

  const AccountSettingsState({
    this.changePasswordExpanded = false,
    this.isLoading = false,
    this.errorMessage,
    this.loggedOut = false,
    this.accountDeleted = false,
  });

  AccountSettingsState copyWith({
    bool? changePasswordExpanded,
    bool? isLoading,
    String? errorMessage,
    bool? loggedOut,
    bool? accountDeleted,
  }) {
    return AccountSettingsState(
      changePasswordExpanded:
          changePasswordExpanded ?? this.changePasswordExpanded,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      loggedOut: loggedOut ?? this.loggedOut,
      accountDeleted: accountDeleted ?? this.accountDeleted,
    );
  }

  @override
  List<Object?> get props => [
        changePasswordExpanded,
        isLoading,
        errorMessage,
        loggedOut,
        accountDeleted
      ];
}
