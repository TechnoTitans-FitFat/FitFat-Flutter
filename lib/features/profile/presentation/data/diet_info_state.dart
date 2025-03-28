part of 'diet_info_cubit.dart';
abstract class DietState extends Equatable {
  @override
  List<Object> get props => [];
}

class DietInitial extends DietState {}

class DietLoading extends DietState {}

class DietLoaded extends DietState {
  final GetDietInfo dietInfo;
  DietLoaded(this.dietInfo);

  @override
  List<Object> get props => [dietInfo];
}

class DietError extends DietState {
  final String message;
  DietError(this.message);

  @override
  List<Object> get props => [message];
}
