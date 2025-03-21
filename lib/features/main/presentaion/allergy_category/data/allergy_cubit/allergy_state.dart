
import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';

abstract class AllergyState extends Equatable {
  @override
  List<Object> get props => [];
}

class AllergyInitial extends AllergyState {}

class AllergyLoading extends AllergyState {}

class AllergySucess extends AllergyState {
  final List<AllergyModel> data;

   AllergySucess({required this.data});

  @override
  List<Object> get props => [data];
}

class AllergyFailure extends AllergyState {
  final String errMessage;
  AllergyFailure({required this.errMessage});

 @override
  List<Object> get props => [errMessage];
}