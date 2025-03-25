
import 'package:equatable/equatable.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/data/models/diabets_model.dart';


abstract class DiabetsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DiabetsInitial extends DiabetsState {}

class DiabetsLoading extends DiabetsState {}

class DiabetsSucess extends DiabetsState {
  final List<DiabetsModel> data;

  DiabetsSucess({required this.data});

  @override
  List<Object> get props => [data];
}

class DiabetsFailure extends DiabetsState {
  final String errMessage;
  DiabetsFailure({required this.errMessage});

 @override
  List<Object> get props => [errMessage];
}