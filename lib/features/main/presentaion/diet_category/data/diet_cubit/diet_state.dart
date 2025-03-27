import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';

abstract class DietState extends Equatable {
  @override
  List<Object> get props => [];
}

class DietInitial extends DietState {}

class DietLoading extends DietState {}

class DietSuccess extends DietState {
  final List<DietModel> data;

  DietSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class DietFailure extends DietState {
  final String errMessage;

  DietFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
