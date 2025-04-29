import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/cart/data/models/get_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/core/api/api_services.dart';
import 'package:flutter/material.dart';
part 'get_cart_state.dart';

class GetCartCubit extends Cubit<CartState> {
  GetCartCubit(this.api) : super(CartInitial());

  final ApiServices api;

  Future<void> getCart({String? id, int? count, required BuildContext context}) async {
    try {
      emit(CartLoading());
      final token =
          BlocProvider.of<LoginCubit>(context, listen: false).user?.token;

      print(token);
      if (token!.isEmpty) {
        emit( CartError('User not logged in'));
        return;
      }
      final response = await api.getRequest(
        endpoint: 'https://fitfat-backend.up.railway.app/api/cart',
         token: token
      );

      final data = response.data;
      if (data["status"] == true) {
        final cart = GetCartModel.fromJson(data);
        print(cart);
        emit(CartLoaded(cart));
      } else {
        emit(CartError("Failed to fetch cart"));
      }

      print("🟢 Cart Response: $data");
    } catch (e) {
      emit(CartError("Failed"));
      print("❌ Error: ${e.toString()}");
    }
  }
}
