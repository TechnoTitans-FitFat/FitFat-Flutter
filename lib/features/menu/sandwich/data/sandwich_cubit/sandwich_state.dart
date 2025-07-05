part of 'sandwich_cubit.dart';

sealed class SandwichState extends Equatable {
  const SandwichState();

  @override
  List<Object> get props => [];
}

final class SandwichInitial extends SandwichState {}
class SandwichLoading extends SandwichState {}

class SandwichSuccess extends SandwichState {
  final List<SandwichModel> data;

  const SandwichSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class SandwichFailure extends SandwichState {
  final String errMessage;

  const SandwichFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
