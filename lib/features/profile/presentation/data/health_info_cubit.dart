
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/cache/cache_helper.dart';
import 'package:fitfat/features/profile/presentation/models/health_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_services.dart';
part 'health_info_states.dart';
class GetHealthInfoCubit extends Cubit<GetHealthInfoState> {
  GetHealthInfoCubit( this.api) : super(UserInitial());

  final ApiServices api;
  String? id;
  getUserProfile() async {
    emit(UserLoading());
    try {
       id = CacheHelper().getData(key: ApiKey.id);
      final response = await api.getRequest(
        endpoint: "${EndPoint.getHealthInfo}$id",
      );

      final data = response.data;
      if (data["status"] == true) {
        final healthInfo = GetHealthModel.fromJson(data);
        emit(UserLoaded(healthInfo));
      } else {
        emit(UserError("Failed to fetch health info"));
      }
    }  catch (e) {
      emit(UserError("Error: ${e.toString()}"));
    }
  }
}
