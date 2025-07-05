
import 'package:equatable/equatable.dart';
import 'package:fitfat/features/menu/chicken/data/models/chicken_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ChickenState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChickenInitial extends ChickenState {}

class ChickenLoading extends ChickenState {}

class ChickenSuccess extends ChickenState {
  final List<ChickenModel> data;

  ChickenSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class ChickenFailure extends ChickenState {
  final String errMessage;

  ChickenFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
