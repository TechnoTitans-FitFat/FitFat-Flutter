import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/diet_info_model.dart';

@immutable
abstract class DietInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class DietInfoInitial extends DietInfoState {}

class DietInfoLoading extends DietInfoState {}

class DietInfoSuccess extends DietInfoState {
  final DietInfoModel dietInfoModel;

  DietInfoSuccess({required this.dietInfoModel});

  @override
  List<Object> get props => [dietInfoModel];
}

class DietInfoFailure extends DietInfoState {
  final String errMessage;

  DietInfoFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
