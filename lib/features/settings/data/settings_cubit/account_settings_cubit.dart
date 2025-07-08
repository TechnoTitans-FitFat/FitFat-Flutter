import 'package:dio/dio.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/utils/auth_utils.dart';
import 'package:fitfat/features/settings/data/settings_cubit/account_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_consumer.dart';

class AccountSettingsCubit extends Cubit<AccountSettingsState> {
  final ApiConsumer apiConsumer;
  // Controllers for text fields
  final TextEditingController lastPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController otpController = TextEditingController();

  AccountSettingsCubit(this.apiConsumer) : super(const AccountSettingsState());

  void toggleChangePasswordExpanded() {
    emit(state.copyWith(changePasswordExpanded: !state.changePasswordExpanded));
  }

  Future<void> logout(String token) async {
    try {
      emit(state.copyWith(isLoading: true));

      // Call logout API
      await apiConsumer.post(
        EndPoint.logout,
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );

      // Clear local authentication data
      await AuthUtils.clearAuthData();

      emit(state.copyWith(
          isLoading: false,
          loggedOut: true,
          successMessage: "Logged out successfully"));
    } on DioException catch (error) {
      // Even if API call fails, clear local data
      await AuthUtils.clearAuthData();
      emit(state.copyWith(
          isLoading: false,
          loggedOut: true,
          successMessage: "Logged out successfully"));
      print('Logout error: ${error.message}');
    } catch (error) {
      // Even if API call fails, clear local data
      await AuthUtils.clearAuthData();
      emit(state.copyWith(
          isLoading: false,
          loggedOut: true,
          successMessage: "Logged out successfully"));
      print('Unexpected error during logout: $error');
    }
  }

  void showOTPField() {
    // Update state to show OTP field
    emit(state.copyWith(showOTPField: true));
    // Then request OTP is handled in the view by calling ForgotPasswordCubit
  }

  Future<void> deleteAccount(String token) async {
    try {
      emit(state.copyWith(isLoading: true));
      await apiConsumer.delete(
        'https://fitfat-backend.up.railway.app/users',
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
      );
      emit(state.copyWith(
          isLoading: false,
          accountDeleted: true,
          successMessage: "Account deleted successfully"));
      print('Account successfully deleted');
    } on DioException catch (error) {
      emit(state.copyWith(
          isLoading: false,
          errorMessage:
              error.response?.data['message'] ?? 'Account deletion failed'));
      print('Account deletion error: ${error.message}');
    } catch (error) {
      emit(state.copyWith(
          isLoading: false,
          errorMessage:
              'An unexpected error occurred during account deletion'));
      print('Unexpected error during account deletion: $error');
    }
  }

  void setOtpVerified(bool verified) {
    emit(state.copyWith(otpVerified: verified));
  }

  void clearMessages() {
    emit(state.copyWith(errorMessage: '', successMessage: ''));
  }

  @override
  Future<void> close() {
    lastPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    return super.close();
  }
}
