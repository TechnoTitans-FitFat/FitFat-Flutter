import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

part 'clear_cart_state.dart';

class ClearCartCubit extends Cubit<ClearState> {
  ClearCartCubit(this.api) : super(ClearInitial());
  final ApiServices api;

  Future<void> clear({required BuildContext context}) async {
    try {
      emit(ClearLoading());

      final token =
          BlocProvider.of<LoginCubit>(context, listen: false).user?.token;
      if (token == null || token.isEmpty) {
        emit(ClearFailure(error: 'User not logged in'));
        return;
      }

      final response = await api.deleteRequest(
        endpoint: 'https://fitfattt.azurewebsites.net/api/cart/clear',
        token: token,
      );

      if (response.statusCode == 200) {
        emit(ClearSuccess(message: "Cart cleared successfully"));
      } else if (response.statusCode == 400) {
        final body = jsonDecode(response.data);
        final errorMessage =
            body['message'] ?? 'Invalid request. Please check your data.';
        emit(ClearFailure(error: errorMessage));
      } else {
        final body = jsonDecode(response.data);
        final errorMessage = body['message'] ??
            "Failed to delete product. Status code: ${response.statusCode}";
        emit(ClearFailure(error: errorMessage));
      }
    } on FormatException catch (e) {
      emit(ClearFailure(error: 'Data parsing error: ${e.message}'));
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response?.data;
        final errorMessage =
            errorData is Map ? errorData['message'] ?? e.message : e.message;
        emit(ClearFailure(error: errorMessage.toString()));
      } else {
        emit(ClearFailure(error: 'Network error: ${e.message}'));
      }
    } catch (e) {
      emit(ClearFailure(error: 'Unexpected error: ${e.toString()}'));
    }
  }
}
