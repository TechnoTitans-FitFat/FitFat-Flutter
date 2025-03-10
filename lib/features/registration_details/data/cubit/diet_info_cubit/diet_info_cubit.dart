import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/features/registration_details/data/model/health_info_model.dart';
import 'package:fitfat/features/registration_details/data/cubit/diet_info_cubit/diet_info_state.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/diet_info_model.dart';

class DietInfoCubit extends Cubit<DietInfoState> {
  final ApiConsumer apiConsumer;
  DietInfoCubit(this.apiConsumer) : super(DietInfoInitial());
  void postDietInfo({
    required String token,
    required String dietType,
    required Map<String, int> macronutrientGoals,
    required String dietaryGoals,
    required String activityLevel,
    required List<String> mealPreferences,
  }) async {
    emit(DietInfoLoading());
    try {
      final response = await apiConsumer.post(
        EndPoint.dietInfo,
        data: {
          "dietType": dietType,
          "macronutrientGoals": macronutrientGoals,
          "dietaryGoals": dietaryGoals,
          "activityLevel": activityLevel,
          "mealPreferences": mealPreferences,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      String responseString = response.toString();
      if (responseString == null) {
        emit(DietInfoFailure(errMessage: "data is null"));
      } else {
        emit(
          DietInfoSuccess(
            dietInfoModel: DietInfoModel(
              activityLevel: activityLevel,
              dietType: dietType,
              dietaryGoals: dietaryGoals,
              macronutrientGoals: macronutrientGoals,
              mealPreferences: mealPreferences,
            ),
          ),
        );
      }
      print('Raw Response: ${response.toString()}');
    } catch (e) {
      emit(DietInfoFailure(errMessage: e.toString()));
    }
  }
}
