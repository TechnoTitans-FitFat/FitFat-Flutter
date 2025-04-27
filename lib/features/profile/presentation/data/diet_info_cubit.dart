import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/cache/cache_helper.dart';
import 'package:fitfat/features/profile/presentation/models/diet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/api_services.dart';
part 'diet_info_state.dart';

class GetDietInfoCubit extends Cubit<DietInfoState> {
  GetDietInfoCubit( this.api) : super(DietInfoInitial());

  String? id;
  final ApiServices api;
  Future<void> getDietInfo() async {
    emit(DietInfoLoading());
    try {
      id = CacheHelper().getData(key: ApiKey.id);
      final response = await api.getRequest(
        endpoint: "${EndPoint.dietInfo}$id",
      );

      final data = response.data;
      if (data["status"] == true) {
        final dietInfo = GetDietInfoModel.fromJson(data);
        emit(DietInfoLoaded(dietInfo));
      } else {
        emit(DietInfoError("Failed to fetch health info"));
      }
      print("🟢 Response received: $data");
    }  catch (e) {
      emit(DietInfoError("Error: ${e.toString()}"));
      print(e.toString());
    }
  }
}
