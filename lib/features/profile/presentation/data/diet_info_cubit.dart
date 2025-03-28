import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:fitfat/features/profile/presentation/models/diet_model.dart';

part 'diet_info_state.dart';

class DietCubit extends Cubit<DietState> {
  DietCubit() : super(DietInitial());

  Future<void> fetchDietInfo(String userId) async {
    emit(DietLoading());

    try {
      final response = await Dio().get(
          'https://fitfat-backend.up.railway.app/api/dietInfo/$userId');

      if (response.statusCode == 200) {
        final dietInfo = GetDietInfo.fromJson(response.data['dietInfo']);
        emit(DietLoaded(dietInfo));
      } else {
        emit(DietError("Failed to load data"));
      }
    } catch (e) {
      emit(DietError(e.toString()));
    }
  }
}
