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
       // id = CacheHelper().getData(key: ApiKey.id);
      final response = await api.getRequest(
        // endpoint: "${EndPoint.getHealthInfo}$id",
        endpoint: 'https://fitfat-backend.up.railway.app/api/healthInfo/67e5eb180b8e8a027bd2d5a7'
      );
      final data = response.data;
      if (data["status"] == true) {
        final healthInfo = GetHealthModel.fromJson(data);
        emit(UserLoaded(healthInfo));
      } else {
        emit(UserError("Failed to fetch health info"));
      }
    }  catch (e) {
      emit(UserError("Error: Failed"));
      print(e.toString());
    }
  }
}
