// cart_state.dart
part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final String message;

  CartSuccess({required this.message});
}

class CartFailure extends CartState {
  final String error;

  CartFailure({required this.error});
}
