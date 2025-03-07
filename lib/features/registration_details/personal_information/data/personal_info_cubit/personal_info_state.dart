import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/model/health_info_model.dart';

@immutable
abstract class PersonalInfoState extends Equatable {
  @override
  List<Object> get props => [];
}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoLoading extends PersonalInfoState {}

class PersonalInfoSuccess extends PersonalInfoState {
  final PersonalInfoModel personalInfoModel;

  PersonalInfoSuccess({required this.personalInfoModel});

  @override
  List<Object> get props => [personalInfoModel];
}

class PersonalInfoFailure extends PersonalInfoState {
  final String errMessage;

  PersonalInfoFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
