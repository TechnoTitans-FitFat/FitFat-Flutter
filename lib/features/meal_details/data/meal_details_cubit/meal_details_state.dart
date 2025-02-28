

import 'package:equatable/equatable.dart';
import 'package:fitfat/features/meal_details/data/models/meal_details_model.dart';
import 'package:flutter/material.dart';

@immutable

abstract class MealDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class MealDetailsInitial extends MealDetailsState {}

class MealDetailsLoading extends MealDetailsState {}

class MealDetailsSucess extends MealDetailsState {
  final List<MealDetailsModel> data;

   MealDetailsSucess({required this.data});

  @override
  List<Object> get props => [data];
}

class MealDetailsFailure extends MealDetailsState {
  final String errMessage;
  MealDetailsFailure({required this.errMessage});

 @override
  List<Object> get props => [errMessage];
}