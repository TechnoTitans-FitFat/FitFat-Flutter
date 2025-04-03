import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/cache/cache_helper.dart';
import 'package:fitfat/features/auth/data/Cubit/blocs/auth_bloc/login_cubit.dart';
import 'package:fitfat/features/profile/presentation/data/health_info_cubit.dart';
import 'package:fitfat/features/profile/presentation/models/update_health_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_health_state.dart';
class UpdateHealthInfoCubit extends Cubit<UpdateHealthInfoState> {
  final Dio _dio = Dio();
  final String apiUrl = "https://fitfat-backend.up.railway.app/api/healthInfo/";

  UpdateHealthInfoCubit() : super(HealthInfoInitial());

  Future<void> updateHealthInfo( UpdateHealthInfo healthInfo, {required BuildContext context}) async {
    emit(HealthInfoLoading());
    try {
      final id = BlocProvider.of<LoginCubit>(context, listen: false).user?.id;
      print(id);
      if (id == null || id.isEmpty) {
        emit(HealthInfoError("User ID is missing"));
        return;
      }
      print("🚀 Sending update request with data: ${healthInfo.toJson()}");
      final response = await _dio.put(
        "$apiUrl$id",
        data: healthInfo.toJson(),
      );
      print(response);
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