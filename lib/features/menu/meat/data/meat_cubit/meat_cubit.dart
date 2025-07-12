import 'package:bloc/bloc.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/menu/meat/data/meat_cubit/meat_states.dart';
import 'package:fitfat/features/menu/meat/data/models/meat_model.dart'; 


class MeatCubit extends Cubit<MeatState> {
  final ApiConsumer apiConsumer;

  MeatCubit(this.apiConsumer) : super(MeatInitial());

  void fetchMeatRecipes() async {
    emit(MeatLoading());
    try {
      final response = await apiConsumer.get(EndPoint.meat);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<MeatModel> data = recipes
              .map((item) => MeatModel.fromJson(item))
              .toList();

          emit(MeatSuccess(data: data));
        } else {
          emit(MeatFailure(errMessage: "No chicken recipes found"));
        }
      } else {
        emit(MeatFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(MeatFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(MeatFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}
