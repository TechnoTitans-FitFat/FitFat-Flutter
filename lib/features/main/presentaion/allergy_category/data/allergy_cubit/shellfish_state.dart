import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';

abstract class ShellfishState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShellfishInitial extends ShellfishState {}

class ShellfishLoading extends ShellfishState {}

class ShellfishSuccess extends ShellfishState {
  final List<AllergyModel> data;

  ShellfishSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class ShellfishFailure extends ShellfishState {
  final String errMessage;

  ShellfishFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
