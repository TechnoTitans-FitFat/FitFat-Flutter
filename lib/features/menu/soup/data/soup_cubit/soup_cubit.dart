import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/menu/soup/data/models/soup_model.dart';

part 'soup_state.dart';

class SoupCubit extends Cubit<SoupState> {
  final ApiConsumer apiConsumer;
  SoupCubit(this.apiConsumer) : super(SoupInitial());

   void fetchSoupRecipes() async {
    emit(SoupLoading());
    try {
      final response = await apiConsumer.get(EndPoint.soup);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<SoupModel> data = recipes
              .map((item) => SoupModel.fromJson(item))
              .toList();

          emit(SoupSuccess(data: data));
        } else {
          emit(const SoupFailure(errMessage: "No chicken recipes found"));
        }
      } else {
        emit(const SoupFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(SoupFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(SoupFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}


