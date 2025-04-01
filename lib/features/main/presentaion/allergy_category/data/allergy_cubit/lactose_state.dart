import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';


abstract class LactoseState extends Equatable {
  @override
  List<Object> get props => [];
}

class LactoseInitial extends LactoseState {}

class LactoseLoading extends LactoseState {}

class LactoseSuccess extends LactoseState {
  final List<AllergyModel> data;

  LactoseSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class LactoseFailure extends LactoseState {
  final String errMessage;

  LactoseFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
