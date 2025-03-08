import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/meal_details/data/meal_details_cubit/meal_details_state.dart';
import 'package:fitfat/features/meal_details/data/models/meal_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  MealDetailsCubit(this.apiConsumer) : super(MealDetailsInitial());

  final ApiConsumer apiConsumer;

  void fetchMealsDetailsData(String mealId) async {
    emit(MealDetailsLoading());

    try {
      // Construct the correct URL with mealId
      final String url = "${EndPoint.meal_details}$mealId";
      print("Fetching Meal from: $url"); // Debugging

      final response = await apiConsumer.get(url);

      if (response is Map<String, dynamic>) {
        MealDetailsModel data = MealDetailsModel.fromJson(response);
        emit(MealDetailsSucess(data: [data])); // Wrap in list if needed
      } else {
        emit(MealDetailsFailure(errMessage: "Invalid data format"));
      }
    } on ServerException catch (e) {
      emit(MealDetailsFailure(errMessage: e.errModel.errMessage));
    }
  }
}
