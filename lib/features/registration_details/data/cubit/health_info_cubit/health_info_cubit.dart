import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/features/registration_details/data/model/health_info_model.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthInfoCubit extends Cubit<HealthInfoState> {
  final ApiConsumer apiConsumer;
  HealthInfoCubit(this.apiConsumer) : super(HealthInfoInitial());

  void postHealthInfo({
    required String token,
    required List<String> foodAllergies,
    required int diabetes, // Changed from bool to int
    required int weight,
    required int height,
    required String dateOfBirth,
    required String gender,
    required Map<String, int> targetBloodSugarRange,
  }) async {
    emit(HealthInfoLoading());
    try {
      final response = await apiConsumer.post(
        EndPoint.healthInfo,
        data: {
          "foodAllergies": foodAllergies,
          "diabetes": diabetes,
          "weight": weight,
          "height": height,
          "dateOfBirth": dateOfBirth,
          "gender": gender,
          "targetBloodSugarRange": targetBloodSugarRange
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

      if (response == null) {
        emit(HealthInfoFailure(errMessage: "Response is null"));
        return;
      }

      // Check for errors in response
      if (response.data != null &&
          response.data['status'] != null &&
          response.data['status'] == false) {
        emit(HealthInfoFailure(
            errMessage: response.data['message'] ?? "Unknown error"));
        return;
      }

      // Convert diabetes back to boolean for the model
      bool diabetesBool = diabetes == 1;

      emit(
        HealthInfoSuccess(
          healthInfoModel: HealthInfoModel(
            foodAllergies: foodAllergies,
            diabetes: diabetesBool, // Store as boolean in model
            weight: weight,
            height: height,
            dateOfBirth: dateOfBirth,
            gender: gender,
            targetBloodSugarRange: targetBloodSugarRange,
          ),
        ),
      );

      print('Raw Response: ${response.toString()}');
    } catch (e) {
      emit(HealthInfoFailure(errMessage: e.toString()));
    }
  }
}
