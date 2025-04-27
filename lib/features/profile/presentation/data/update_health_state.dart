part of'update_health_cubit.dart';


abstract class UpdateHealthInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class HealthInfoInitial extends UpdateHealthInfoState {}

class HealthInfoLoading extends UpdateHealthInfoState {}

class HealthInfoLoaded extends UpdateHealthInfoState {
  final UpdateHealthInfo healthInfo;
  HealthInfoLoaded(this.healthInfo);

  @override
  List<Object> get props => [healthInfo];
}

class HealthInfoError extends UpdateHealthInfoState {
  final String message;
  HealthInfoError(this.message);

  @override
  List<Object> get props => [message];
}