part of 'soup_cubit.dart';

sealed class SoupState extends Equatable {
  const SoupState();

  @override
  List<Object> get props => [];
}

final class SoupInitial extends SoupState {}
class SoupLoading extends SoupState {}

class SoupSuccess extends SoupState {
  final List<SoupModel> data;

  const SoupSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class SoupFailure extends SoupState {
  final String errMessage;

  const SoupFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}