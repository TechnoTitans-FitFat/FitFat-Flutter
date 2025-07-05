import 'package:bloc/bloc.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/menu/chicken/data/chicken_cubit/chicken_states.dart';
import 'package:fitfat/features/menu/chicken/data/models/chicken_model.dart'; 


class ChickenCubit extends Cubit<ChickenState> {
  final ApiConsumer apiConsumer;

  ChickenCubit(this.apiConsumer) : super(ChickenInitial());

  void fetchChickenRecipes() async {
    emit(ChickenLoading());
    try {
      final response = await apiConsumer.get(EndPoint.chicken);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<ChickenModel> data = recipes
              .map((item) => ChickenModel.fromJson(item))
              .toList();

          emit(ChickenSuccess(data: data));
        } else {
          emit(ChickenFailure(errMessage: "No chicken recipes found"));
        }
      } else {
        emit(ChickenFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(ChickenFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(ChickenFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}
