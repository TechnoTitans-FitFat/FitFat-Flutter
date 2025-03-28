import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';

abstract class VeganState extends Equatable {
  @override
  List<Object> get props => [];
}

class VeganInitial extends VeganState {}

class VeganLoading extends VeganState {}

class VeganSuccess extends VeganState {
  final List<DietModel> data;

  VeganSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class VeganFailure extends VeganState {
  final String errMessage;

  VeganFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
