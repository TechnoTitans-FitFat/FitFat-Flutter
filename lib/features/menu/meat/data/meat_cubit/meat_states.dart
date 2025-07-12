
import 'package:equatable/equatable.dart';
import 'package:fitfat/features/menu/meat/data/models/meat_model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MeatState extends Equatable {
  @override
  List<Object> get props => [];
}

class MeatInitial extends MeatState {}

class MeatLoading extends MeatState {}

class MeatSuccess extends MeatState {
  final List<MeatModel> data;

  MeatSuccess({required this.data});

  @override
  List<Object> get props => [data];
}

class MeatFailure extends MeatState {
  final String errMessage;

  MeatFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
