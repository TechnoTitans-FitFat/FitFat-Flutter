import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';

abstract class HighCarbState extends Equatable {
  @override
  List<Object> get props => [];
}

class HighCarbInitial extends HighCarbState {}

class HighCarbLoading extends HighCarbState {}

class HighCarbSuccess extends HighCarbState {
  final List<DietModel> data;

  HighCarbSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class HighCarbFailure extends HighCarbState {
  final String errMessage;

  HighCarbFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
