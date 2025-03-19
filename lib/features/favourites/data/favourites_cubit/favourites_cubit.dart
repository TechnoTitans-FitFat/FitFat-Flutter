import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/cache/cache_helper.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/favourites/data/model/favourites_model.dart';
import 'package:flutter/material.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final ApiConsumer apiConsumer;
  FavouritesCubit(this.apiConsumer) : super(FavouritesInitial());

  List<FavouritesModel> favourites = [];

  void getFavourites() async{
   try{
     emit(FavouritesLoading());
     final cacheHelper = CacheHelper();
     final token= cacheHelper.getData(key: ApiKey.token);
     if(token==null){
      emit(FavouritesFailure(errMessage: 'User not logged in'));
      return;
     }
     final response = await apiConsumer.get(EndPoint.favourites,
        queryParameters: {
          'Authorization': 'Bearer $token', 
        },
      );
      favourites = (response as List)
          .map((item) => FavouritesModel.fromJson(item))
          .toList();

          emit(FavouritesSuccess(data: List.from(favourites)));
   } on ServerException catch (e) {
      emit(FavouritesFailure(errMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(FavouritesFailure(errMessage: "Dio error: ${e.message}"));
    } catch (e) {
      emit( FavouritesFailure(errMessage: "Unexpected error occurred"));
    }

  }

  void addToFavourite(String itemId) async{
    try{
      emit(FavouritesLoading());
       print("جاري إضافة للمفضلة...");
       
       final cacheHelper = CacheHelper();
     final token= cacheHelper.getData(key: ApiKey.token);
     if(token==null){
      emit(FavouritesFailure(errMessage: 'User not logged in'));
      return;
     }
     final response = await apiConsumer.post(EndPoint.favourites,
     data: {"item_id": itemId},
        queryParameters: {
          'Authorization': 'Bearer $token',
        },
     );
     favourites.add(FavouritesModel.fromJson(response));
      print("تمت الإضافة بنجاح!");
     emit(FavouritesSuccess(data: List.from(favourites)));
    } on ServerException catch (e) {
    emit(FavouritesFailure(errMessage: e.errModel.errMessage));
  } on DioException catch (e) {
    emit(FavouritesFailure(errMessage: "Dio error: ${e.message}"));
  } catch (e) {
    print("خطأ أثناء الإضافة: $e");
    emit(FavouritesFailure(errMessage: "Unexpected error occurred"));
  }
  }

  void deleteFromFavourite(String itemId) async {
    try{
      emit(FavouritesLoading());
      final cacheHelper = CacheHelper();
      final token = cacheHelper.getData(key: ApiKey.token);
      if (token == null) {
        emit(FavouritesFailure(errMessage: 'User not logged in'));
        return;
      }
      await apiConsumer.delete(
        "${EndPoint.favourites}/$itemId",
        queryParameters: {
          'Authorization': 'Bearer $token',
        },
      );
       favourites.removeWhere((fav) => fav.id == itemId);
      emit(FavouritesSuccess(data: List.from(favourites)));
    } on ServerException catch (e) {
      emit(FavouritesFailure(errMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(FavouritesFailure(errMessage: "Dio error: ${e.message}"));
    } catch (e) {
      emit(FavouritesFailure(errMessage: "Unexpected error occurred"));
    }
  }
    
}
