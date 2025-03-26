import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';

abstract class LowCarbState extends Equatable {
  @override
  List<Object> get props => [];
}

class LowCarbInitial extends LowCarbState {}

class LowCarbLoading extends LowCarbState {}

class LowCarbSuccess extends LowCarbState {
  final List<DietModel> data;

  LowCarbSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class LowCarbFailure extends LowCarbState {
  final String errMessage;

  LowCarbFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
