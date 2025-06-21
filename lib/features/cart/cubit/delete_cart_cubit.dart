import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

part 'delete_cart_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit(this.api) : super(DeleteInitial());
  final ApiServices api;

  Future<void> delete({required String productId,required BuildContext context}) async {
    try {
      emit(DeleteLoading());

      final token =
          BlocProvider.of<LoginCubit>(context, listen: false).user?.token;
      if (token == null || token.isEmpty) {
        emit(DeleteFailure(error: 'User not logged in'));
        return;
      }

      if (productId.isEmpty) {
        emit(DeleteFailure(error: 'Product ID is missing'));
        return;
      }


      final response = await api.deleteRequest(
        endpoint: 'https://fitfattt.azurewebsites.net/api/cart/delete',
        token: token,
        data: {"productId": productId},
      );


      if (response.statusCode == 200) {
        emit(DeleteSuccess(message: "Product deleted successfully"));
      } else if (response.statusCode == 400) {
        final body = jsonDecode(response.data);
        final errorMessage =
            body['message'] ?? 'Invalid request. Please check your data.';
        emit(DeleteFailure(error: errorMessage));
      } else {
        final body = jsonDecode(response.data);
        final errorMessage = body['message'] ??
            "Failed to delete product. Status code: ${response.statusCode}";
        emit(DeleteFailure(error: errorMessage));
      }
    } on FormatException catch (e) {
      emit(DeleteFailure(error: 'Data parsing error: ${e.message}'));
    } on DioException catch (e) {
      // معالجة أخطاء Dio بشكل خاص
      if (e.response != null) {
        final errorData = e.response?.data;
        final errorMessage =
            errorData is Map ? errorData['message'] ?? e.message : e.message;
        emit(DeleteFailure(error: errorMessage.toString()));
      } else {
        emit(DeleteFailure(error: 'Network error: ${e.message}'));
      }
    } catch (e) {
      emit(DeleteFailure(error: 'Unexpected error: ${e.toString()}'));
    }
  }
}
