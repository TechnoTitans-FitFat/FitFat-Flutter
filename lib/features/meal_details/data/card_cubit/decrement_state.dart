part of 'decrement_cubit.dart';

@immutable
abstract class DecrementState {}

class DecrementInitial extends DecrementState {}

class DecrementLoading extends DecrementState {}

class DecrementSuccess extends DecrementState {
  final String message;
  DecrementSuccess({required this.message});
}

class DecrementFailure extends DecrementState {
  final String error;

  DecrementFailure({required this.error});
}
