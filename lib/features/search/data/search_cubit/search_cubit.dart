import 'package:fitfat/features/search/data/models/search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final ApiConsumer apiConsumer;
  SearchCubit(this.apiConsumer) : super(SearchInitial());

  void searchRecipes(String query) async {
    emit(SearchLoading());
    try {
      final response = await apiConsumer.get(
        EndPoint.search,
        queryParameters: {'name': query},
      );

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
      final List<SearchRecipeModel> results =
          (response['recipes'] as List)
              .map((e) => SearchRecipeModel.fromJson(e))
              .toList();

        if (results.isNotEmpty) {
          emit(SearchSuccess(results));
        } else {
          emit(SearchFailure(errMessage: "there is no matching result"));
        }
      } else {
        emit(SearchFailure(errMessage: "response is false"));
      }
    } on ServerException catch (e) {
      emit(SearchFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(SearchFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}
