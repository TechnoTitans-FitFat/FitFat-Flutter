part of 'diet_info_cubit.dart';

abstract class DietInfoState {}

class DietInfoInitial extends DietInfoState {}

class DietInfoLoading extends DietInfoState {}

class DietInfoLoaded extends DietInfoState {
  final GetDietInfoModel dietInfo;

  DietInfoLoaded(this.dietInfo);
}

class DietInfoError extends DietInfoState {
  final String message;

  DietInfoError(this.message);
}
