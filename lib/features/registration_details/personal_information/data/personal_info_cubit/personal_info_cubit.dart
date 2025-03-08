import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/error_model.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/core/helper/show_snack_bar.dart';
import 'package:fitfat/features/registration_details/data/model/health_info_model.dart';
import 'package:fitfat/features/registration_details/personal_information/data/personal_info_cubit/personal_info_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final ApiConsumer apiConsumer;
  PersonalInfoCubit(this.apiConsumer) : super(PersonalInfoInitial());

  void postPersonalInfo({required String token}) async {
    emit(PersonalInfoLoading());
    try {
      final response = await apiConsumer.post(
        EndPoint.healthInfo,
        data: {
          "foodAllergies": ["Peanuts", "Gluten"],
          "diabetes": true,
          "weight": 90,
          "height": 180,
          "dateOfBirth": "1990-01-01T00:00:00.000Z",
          "gender": "female",
          "targetBloodSugarRange": {"min": 50, "max": 120}
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
        emit(PersonalInfoFailure(errMessage: "data is null "));
      } else {
        emit(
          PersonalInfoSuccess(
            personalInfoModel: PersonalInfoModel(
              weight: 90,
              height: 180,
              dateOfBirth: "1990-01-01T00:00:00.000Z",
              gender: "female",
              foodAllergies: ["Peanuts", "Gluten"],
              diabetes: true,
              targetBloodSugarRange: {"min": 50, "max": 120},
            ),
          ),
        );
      }
      print('Raw Response: ${response.toString()}');
    } catch (e) {}
  }
}
