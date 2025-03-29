import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/wheat_state.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WheatCubit extends Cubit<WheatState> {
  final ApiConsumer apiConsumer;

  WheatCubit(this.apiConsumer) : super(WheatInitial());

  Future<void> fetchWheatData() async {
    emit(WheatLoading());

    try {
      final response = await apiConsumer.get(
        EndPoint.wheatView
      );

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final recipes = response['recipes'];

        if (recipes is List) {
          final List<AllergyModel> data = recipes
              .cast<Map<String, dynamic>>() 
              .map((item) => AllergyModel.fromJson(item))
              .take(6) 
              .toList();

          if (data.isNotEmpty) {
            emit(WheatSuccess(data: data));
          } else {
            emit(WheatFailure(errMessage: "No allergy recipes found."));
          }
        } else {
          emit(WheatFailure(errMessage: "Invalid API response format (Expected List)."));
        }
      } else {
        emit(WheatFailure(errMessage: "Unexpected API response structure."));
      }
    } on ServerException catch (e) {
      emit(WheatFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(WheatFailure(errMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
