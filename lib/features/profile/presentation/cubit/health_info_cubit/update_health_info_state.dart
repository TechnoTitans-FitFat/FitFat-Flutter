part of 'update_health_info_cubit.dart';

abstract class UpdateHealthInfoState extends Equatable {
  const UpdateHealthInfoState();

  @override
  List<Object> get props => [];
}

class UpdateHealthInfoInitial extends UpdateHealthInfoState {}

class UpdateHealthInfoLoading extends UpdateHealthInfoState {}

class UpdateHealthInfoLoaded extends UpdateHealthInfoState {
  final HealthInfo healthInfo;

  const UpdateHealthInfoLoaded(this.healthInfo);

  @override
  List<Object> get props => [healthInfo];
}

class UpdateHealthInfoError extends UpdateHealthInfoState {
  final String message;

  const UpdateHealthInfoError(this.message);

  @override
  List<Object> get props => [message];
}
