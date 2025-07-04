part of 'update_diet_info_cubit.dart';

abstract class UpdateDietInfoState extends Equatable {
  const UpdateDietInfoState();

  @override
  List<Object> get props => [];
}

class UpdateDietInfoInitial extends UpdateDietInfoState {}

class UpdateDietInfoLoading extends UpdateDietInfoState {}

class UpdateDietInfoLoaded extends UpdateDietInfoState {
  final DietInfo dietInfo;

  const UpdateDietInfoLoaded(this.dietInfo);

  @override
  List<Object> get props => [dietInfo];
}

class UpdateDietInfoError extends UpdateDietInfoState {
  final String message;

  const UpdateDietInfoError(this.message);

  @override
  List<Object> get props => [message];
}
