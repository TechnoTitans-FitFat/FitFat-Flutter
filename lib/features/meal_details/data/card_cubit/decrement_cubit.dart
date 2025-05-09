import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'decrement_state.dart';

class DecrementCubit extends Cubit<DecrementState> {
  DecrementCubit(this.api) : super(DecrementInitial());
  final ApiServices api;
  String? productId;

  decrement({required BuildContext context, required String productId}) async {
    try {
      emit(DecrementLoading());
      final token =
          BlocProvider.of<LoginCubit>(context, listen: false).user?.token;

      if (token == null || token.isEmpty) {
        emit(DecrementFailure(error: 'User not logged in'));
        return;
      }

      final response = await api.postRequest(
        endpoint: 'https://fitfattt.azurewebsites.net/api/cart/decrement',
        token: token,
        data: {
          'productId': productId,
        },
      );

      if (response.statusCode == 200) {
        emit(DecrementSuccess(message: "Product decremented successfully"));
      } else {
        emit(DecrementFailure(error: "Something went wrong"));
      }
    } catch (e) {
      emit(DecrementFailure(error: e.toString()));
    }
  }

}
