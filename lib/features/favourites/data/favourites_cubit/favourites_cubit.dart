import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/favourites/data/model/favourites_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final ApiConsumer apiConsumer;
  FavouritesCubit(this.apiConsumer) : super(FavouritesInitial());

  List<FavouritesModel> favourites = [];

  Future<void> getFavourites(BuildContext context) async {
    try {
      emit(FavouritesLoading());

      final token = context.read<LoginCubit>().user?.token;
      if (token == null) {
        emit(FavouritesFailure(errMessage: 'User not logged in'));
        return;
      }

      final response = await apiConsumer.get(
        EndPoint.favourites,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final List<dynamic> favouritesList = response['favorites'] ?? [];
      favourites = favouritesList.map((item) => FavouritesModel.fromJson(item)).toList();

      emit(FavouritesSuccess(data: List.from(favourites)));
    } on ServerException catch (e) {
      emit(FavouritesFailure(errMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(FavouritesFailure(errMessage: "Dio error: ${e.message}"));
    } catch (e) {
      emit(FavouritesFailure(errMessage: "Unexpected error occurred"));
    }
  }

  Future<void> addToFavourite(BuildContext context, String itemId) async {
    try {
      final token = context.read<LoginCubit>().user?.token;
      if (token == null) {
        emit(FavouritesFailure(errMessage: 'User not logged in'));
        return;
      }

      final response = await apiConsumer.post(
        EndPoint.favourites,
        data: {"recipeId": itemId},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );

      final newFavourite = FavouritesModel.fromJson(response);

      if (!favourites.any((fav) => fav.id == newFavourite.id)) {
        favourites.add(newFavourite);
        emit(FavouritesSuccess(data: List.from(favourites))); // Emit only if the list changes
      }
    } on ServerException catch (e) {
      emit(FavouritesFailure(errMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(FavouritesFailure(errMessage: "Dio error: ${e.message}"));
    } catch (e) {
      emit(FavouritesFailure(errMessage: "Unexpected error occurred"));
    }
  }

  Future<void> deleteFromFavourite(BuildContext context, String itemId) async {
    try {
      final token = context.read<LoginCubit>().user?.token;
      if (token == null) {
        emit(FavouritesFailure(errMessage: 'User not logged in'));
        return;
      }

      await apiConsumer.delete(
        EndPoint.favourites,
        data: {"recipeId": itemId},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        }),
      );

      final beforeDeleteLength = favourites.length;
      favourites.removeWhere((fav) => fav.id == itemId);

      if (beforeDeleteLength != favourites.length) {
        emit(FavouritesSuccess(data: List.from(favourites))); // Emit only if an item was removed
      }
    } on ServerException catch (e) {
      emit(FavouritesFailure(errMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(FavouritesFailure(errMessage: "Dio error: ${e.message}"));
    } catch (e) {
      emit(FavouritesFailure(errMessage: "Unexpected error occurred"));
    }
  }

  bool isFavourite(String itemId) {
    return favourites.any((fav) => fav.id == itemId);
  }
}
