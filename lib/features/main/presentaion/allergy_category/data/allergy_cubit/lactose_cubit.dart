import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/lactose_state.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LactoseCubit extends Cubit<LactoseState> {
  final ApiConsumer apiConsumer;

  LactoseCubit(this.apiConsumer) : super(LactoseInitial());

  Future<void> fetchLactoseData() async {
    emit(LactoseLoading());

    try {
      final response = await apiConsumer.get(
        EndPoint.lactoseView
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
            emit(LactoseSuccess(data: data));
          } else {
            emit(LactoseFailure(errMessage: "No allergy recipes found."));
          }
        } else {
          emit(LactoseFailure(errMessage: "Invalid API response format (Expected List)."));
        }
      } else {
        emit(LactoseFailure(errMessage: "Unexpected API response structure."));
      }
    } on ServerException catch (e) {
      emit(LactoseFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(LactoseFailure(errMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
