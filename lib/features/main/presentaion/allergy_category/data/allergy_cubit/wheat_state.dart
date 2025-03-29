import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';

abstract class WheatState extends Equatable {
  @override
  List<Object> get props => [];
}

class WheatInitial extends WheatState {}

class WheatLoading extends WheatState {}

class WheatSuccess extends WheatState {
  final List<AllergyModel> data;

  WheatSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class WheatFailure extends WheatState {
  final String errMessage;

  WheatFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
