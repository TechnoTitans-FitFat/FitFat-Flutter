import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/low_carb_state.dart';

import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LowCarbCubit extends Cubit<LowCarbState> {
  final ApiConsumer apiConsumer;

  LowCarbCubit(this.apiConsumer) : super(LowCarbInitial());

  Future<void> fetchLowCarbData() async {
    emit(LowCarbLoading());

    try {
      final response = await apiConsumer.get(
        EndPoint.lowCarbView
      );

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final recipes = response['recipes'];

        if (recipes is List) {
          final List<DietModel> data = recipes
              .cast<Map<String, dynamic>>() 
              .map((item) => DietModel.fromJson(item))
              .take(10) 
              .toList();

          if (data.isNotEmpty) {
            emit(LowCarbSuccess(data: data));
          } else {
            emit(LowCarbFailure(errMessage: "No diet recipes found."));
          }
        } else {
          emit(LowCarbFailure(errMessage: "Invalid API response format (Expected List)."));
        }
      } else {
        emit(LowCarbFailure(errMessage: "Unexpected API response structure."));
      }
    } on ServerException catch (e) {
      emit(LowCarbFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(LowCarbFailure(errMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
