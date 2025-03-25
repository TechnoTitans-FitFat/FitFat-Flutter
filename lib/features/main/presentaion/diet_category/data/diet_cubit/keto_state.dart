import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';

abstract class KetoState extends Equatable {
  @override
  List<Object> get props => [];
}

class KetoInitial extends KetoState {}

class KetoLoading extends KetoState {}

class KetoSuccess extends KetoState {
  final List<DietModel> data;

  KetoSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class KetoFailure extends KetoState {
  final String errMessage;

  KetoFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
