abstract class HealthInfoState {}

class HealthInfoInitial extends HealthInfoState {}

class HealthInfoLoading extends HealthInfoState {}

class HealthInfoSuccess extends HealthInfoState {}

class HealthInfoFailure extends HealthInfoState {
  final String errMessage;

  HealthInfoFailure({required this.errMessage});
}
