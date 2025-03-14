abstract class DietInfoState {}

class DietInfoInitial extends DietInfoState {}

class DietInfoLoading extends DietInfoState {}

class DietInfoSuccess extends DietInfoState {}

class DietInfoFailure extends DietInfoState {
  final String errMessage;

  DietInfoFailure({required this.errMessage});
}
