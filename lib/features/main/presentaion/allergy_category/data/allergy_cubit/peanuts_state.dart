import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';

abstract class PeanutsState extends Equatable {
  @override
  List<Object> get props => [];
}

class PeanutsInitial extends PeanutsState {}

class PeanutsLoading extends PeanutsState {}

class PeanutsSuccess extends PeanutsState {
  final List<AllergyModel> data;

  PeanutsSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class PeanutsFailure extends PeanutsState {
  final String errMessage;

  PeanutsFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
