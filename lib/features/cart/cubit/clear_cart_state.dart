part of 'clear_cart_cubit.dart';

abstract class ClearState {}

class ClearInitial extends ClearState {}

class ClearLoading extends ClearState {}

class ClearSuccess extends ClearState {
  final String message;

  ClearSuccess({required this.message});
}

class ClearFailure extends ClearState {
  final String error;

  ClearFailure({required this.error});
}
