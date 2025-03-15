import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/exceptions.dart' show ServerException;

class DietInfoCubit extends Cubit<DietInfoState> {
  final ApiConsumer api;
  DietInfoCubit(this.api) : super(DietInfoInitial());
  void postDietInfo({
    required String dietType,
    required Map<String, int> macronutrientGoals,
    required String dietaryGoals,
    required String activityLevel,
    required String mealPreferences,
    required String userId,
  }) async {
    try {
      emit(DietInfoLoading());

      final Map<String, dynamic> data = {
        'userId': userId,
        "dietType": dietType,
        "macronutrientGoals": macronutrientGoals,
        "dietaryGoals": dietaryGoals,
        "activityLevel": activityLevel,
        "mealPreferences": mealPreferences,
      };

      final response = await api.post(
        EndPoint.dietInfo + "/$userId",
        data: data,
      );

      if (response is Map<String, dynamic> && response.containsKey("status")) {
        if (response["status"] == true) {
          emit(DietInfoSuccess());
        } else {
          emit(DietInfoFailure(
            errMessage:
                response["message"] ?? "Failed to save health information",
          ));
        }
      } else {
        emit(DietInfoFailure(
          errMessage: "Unexpected response format",
        ));
      }
    } on ServerException catch (e) {
      emit(DietInfoFailure(errMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(DietInfoFailure(
        errMessage: e.response?.data["message"] ?? "Unknown error occurred",
      ));
    } catch (e) {
      emit(DietInfoFailure(errMessage: "Unexpected error: $e"));
    }
  }
}
