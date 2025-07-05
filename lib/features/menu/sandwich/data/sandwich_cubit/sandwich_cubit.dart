import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart' show EndPoint;
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/menu/sandwich/data/models/sandwich_model.dart';

part 'sandwich_state.dart';

class SandwichCubit extends Cubit<SandwichState> {
  final ApiConsumer apiConsumer;
  SandwichCubit(this.apiConsumer) : super(SandwichInitial());

  void fetchSandwichsRecipes() async {
    emit(SandwichLoading());
    try {
      final response = await apiConsumer.get(EndPoint.sandwich);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<SandwichModel> data = recipes
              .map((item) => SandwichModel.fromJson(item))
              .toList();

          emit(SandwichSuccess(data: data));
        } else {
          emit(const SandwichFailure(errMessage: "No chicken recipes found"));
        }
      } else {
        emit(const SandwichFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(SandwichFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(SandwichFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}

