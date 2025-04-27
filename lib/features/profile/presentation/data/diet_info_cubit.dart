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
      // id = CacheHelper().getData(key: ApiKey.id);
      final response = await api.getRequest(
        //endpoint: "${EndPoint.dietInfo}$id",
        endpoint: 'https://fitfat-backend.up.railway.app/api/dietInfo/67e5eb180b8e8a027bd2d5a7'
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
      emit(DietInfoError("Failed"));
      print(id);
      print(e.toString());
    }
  }
}
