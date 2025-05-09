import 'package:fitfat/core/api/api_services.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_states.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.api) : super(CartInitial());
  final ApiServices api;
  String? productId;
  int? quantity;

  addCartAndIncrement({required BuildContext context}) async {
    try {
      emit(CartLoading());
      final token =
          BlocProvider.of<LoginCubit>(context, listen: false).user?.token;

      print(token);
      if (token!.isEmpty) {
        emit(CartFailure(error: 'User not logged in'));
        return;
      }
      final response = await api.postRequest(
          endpoint: 'https://fitfattt.azurewebsites.net/api/cart',
          token: token,
          data: {
            'productId': productId,
            'quantity': quantity,
          });
      if (response.statusCode == 200) {
        emit(CartSuccess(message: "Product added successfully"));
        print("Product added successfully");
      } else {
        emit(CartFailure(error: "Something went wrong"));
        print("Falier");
      }
    } catch (e) {
      emit(CartFailure(error: e.toString()));
      print(e.toString());
    }
  }
}
