import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fitfat/features/profile/presentation/models/update_health_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_health_state.dart';
class UpdateHealthInfoCubit extends Cubit<UpdateHealthInfoState> {
  final Dio _dio = Dio();
  final String apiUrl = "https://fitfat-backend.up.railway.app/api/healthInfo/";

  UpdateHealthInfoCubit() : super(HealthInfoInitial());

  Future<void> updateHealthInfo( UpdateHealthInfo healthInfo) async {
    emit(HealthInfoLoading());
    try {
      print("🚀 Sending update request with data: ${healthInfo.toJson()}");
      final response = await _dio.put(
        "${apiUrl}67e5eb180b8e8a027bd2d5a7",
        data: healthInfo.toJson(),
      );
      if (response.statusCode == 200) {
        final data = UpdateHealthInfo.fromJson(response.data['healthInfo']);
        emit(HealthInfoLoaded(data));
        print(response.data);
      } else {
        emit(HealthInfoError("Failed to update health info"));
      }
    } catch (e) {
      emit(HealthInfoError(e.toString()));
      print(e.toString());
    }
  }
}