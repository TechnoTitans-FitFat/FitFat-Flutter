import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/high_carb_state.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HighCarbCubit extends Cubit<HighCarbState> {
  final ApiConsumer apiConsumer;

  HighCarbCubit(this.apiConsumer) : super(HighCarbInitial());

  Future<void> fetchHighCarbData() async {
    emit(HighCarbLoading());

    try {
      final response = await apiConsumer.get(
        EndPoint.highCarbView
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
            emit(HighCarbSuccess(data: data));
          } else {
            emit(HighCarbFailure(errMessage: "No diet recipes found."));
          }
        } else {
          emit(HighCarbFailure(errMessage: "Invalid API response format (Expected List)."));
        }
      } else {
        emit(HighCarbFailure(errMessage: "Unexpected API response structure."));
      }
    } on ServerException catch (e) {
      emit(HighCarbFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(HighCarbFailure(errMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
