import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/health_info_model.dart';

@immutable
abstract class HealthInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class HealthInfoInitial extends HealthInfoState {}

class HealthInfoLoading extends HealthInfoState {}

class HealthInfoSuccess extends HealthInfoState {
  final HealthInfoModel healthInfoModel;

  HealthInfoSuccess({required this.healthInfoModel});

  @override
  List<Object> get props => [healthInfoModel];
}

class HealthInfoFailure extends HealthInfoState {
  final String errMessage;

  HealthInfoFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
