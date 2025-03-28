part of 'health_info_cubit.dart';
abstract class GetHealthInfoState {}

class UserInitial extends GetHealthInfoState {}

class UserLoading extends GetHealthInfoState {}

class UserLoaded extends GetHealthInfoState {
  final GetHealthModel dietModel;
  UserLoaded(this.dietModel);
}

class UserError extends GetHealthInfoState {
  final String message;
  UserError(this.message);
}
