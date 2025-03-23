import 'package:dio/dio.dart';
import 'package:fitfat/core/api/end_points.dart';
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

  AccountSettingsCubit(this.apiConsumer) : super(const AccountSettingsState());

  void toggleChangePasswordExpanded() {
    emit(state.copyWith(changePasswordExpanded: !state.changePasswordExpanded));
  }

  void changePassword() {
    // Implement password change logic here using apiConsumer
    // For example:
    // apiConsumer.post('/change-password', body: {
    //   'oldPassword': lastPasswordController.text,
    //   'newPassword': newPasswordController.text,
    // });
    lastPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    emit(state.copyWith(changePasswordExpanded: false));
  }

  Future<void> logout(String token) async {
    try {
      emit(state.copyWith(isLoading: true));
      await apiConsumer.post(
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
        EndPoint.logout,
      );
      emit(state.copyWith(isLoading: false, loggedOut: true));
    } on DioException catch (error) {
      emit(state.copyWith(
          isLoading: false,
          errorMessage: error.response?.data['message'] ?? 'Logout failed'));
      print('Logout error: ${error.message}');
    } catch (error) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'An unexpected error occurred'));
      print('Unexpected error during logout: $error');
    }
  }

// In your account_settings_cubit.dart file
  Future<void> deleteAccount(String token) async {
    try {
      emit(state.copyWith(isLoading: true));
      await apiConsumer.delete(
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }),
        'https://fitfat-backend.up.railway.app/users',
      );
      emit(state.copyWith(isLoading: false, accountDeleted: true));
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

  @override
  Future<void> close() {
    lastPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
