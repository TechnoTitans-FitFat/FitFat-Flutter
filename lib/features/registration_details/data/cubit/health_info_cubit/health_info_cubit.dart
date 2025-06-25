import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitfat/features/registration_details/data/cubit/health_info_cubit/health_info_state.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:dio/dio.dart';

class HealthInfoCubit extends Cubit<HealthInfoState> {
  final ApiConsumer api;

  HealthInfoCubit(this.api) : super(HealthInfoInitial());

  Future<void> postHealthInfo({
    required String foodAllergies,
    required int diabetes,
    required int weight,
    required int height,
    required String dateOfBirth,
    required String gender,
    required Map<String, int> targetBloodSugarRange,
    required String userId,
    String diabetesType = "",
    double insulinRatio = 0.0,
    required double correctionfactor,
  }) async {
    try {
      emit(HealthInfoLoading());

      final Map<String, dynamic> data = {
        'userId': userId,
        'foodAllergies': foodAllergies,
        'diabetes': diabetes,
        'weight': weight,
        'height': height,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'targetBloodSugarRange': targetBloodSugarRange,
        "correctionFactor": correctionfactor
      };

      // Only add these fields if diabetes is present
      if (diabetes == 1) {
        data['diabetesType'] = diabetesType;
        data['insulinRatio'] = insulinRatio;
      }

      final response = await api.post(
        "${EndPoint.healthInfo}/$userId",
        data: data,
      );

      if (response is Map<String, dynamic> && response.containsKey("status")) {
        if (response["status"] == true) {
          emit(HealthInfoSuccess());
        } else {
          emit(HealthInfoFailure(
            errMessage:
                response["message"] ?? "Failed to save health information",
          ));
        }
      } else {
        emit(HealthInfoFailure(
          errMessage: "Unexpected response format",
        ));
      }
    } on ServerException catch (e) {
      emit(HealthInfoFailure(errMessage: e.errModel.errMessage));
    } on DioException catch (e) {
      emit(HealthInfoFailure(
        errMessage: e.response?.data["message"] ?? "Unknown error occurred",
      ));
    } catch (e) {
      emit(HealthInfoFailure(errMessage: "Unexpected error: $e"));
    }
  }
}
