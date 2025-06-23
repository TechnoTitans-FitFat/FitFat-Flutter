import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/offers/data/model/offer_model.dart';
import 'package:flutter/material.dart';

part 'offer_state.dart';
class OfferCubit extends Cubit<OfferState> {
  final ApiConsumer apiConsumer;
  OfferCubit(this.apiConsumer) : super(OfferInitial());

  void fetchOffersData() async {
    emit(OfferLoading());
   try {
      final response = await apiConsumer.get(EndPoint.offer);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<OfferModel> data = recipes
              .map((item) => OfferModel.fromJson(item)).take(20)
              .toList();

          emit(OfferSucess(data: data));
        } else {
          emit(OfferFailure(errMessage: "No data available"));
        }
      } else {
        emit(OfferFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(OfferFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(OfferFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}


