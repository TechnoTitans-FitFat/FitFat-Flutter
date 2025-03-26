import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/menu/data/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
    final ApiConsumer apiConsumer;
  MenuCubit(this.apiConsumer) : super(MenuInitial());

   void fetchMenuData() async {
    emit(MenuLoading());
   try {
      final response = await apiConsumer.get(EndPoint.menu);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<MenuModel> data = recipes
              .map((item) => MenuModel.fromJson(item)).take(16)
              .toList();

          emit(MenuSucess(data: data));
        } else {
          emit(MenuFailure(errMessage: "No data available"));
        }
      } else {
        emit(MenuFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(MenuFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(MenuFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}
