part of 'delete_cart_cubit.dart';
@immutable
abstract class DeleteState {}

class DeleteInitial extends DeleteState {}

class DeleteLoading extends DeleteState {}

class DeleteSuccess extends DeleteState {
  final String message;

  DeleteSuccess({required this.message});
}

class DeleteFailure extends DeleteState {
  final String error;

  DeleteFailure({required this.error});
}
