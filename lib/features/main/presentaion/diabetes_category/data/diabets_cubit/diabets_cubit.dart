
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/data/diabets_cubit/diabets_state.dart';
import 'package:fitfat/features/main/presentaion/diabetes_category/data/models/diabets_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class DiabetsCubit extends Cubit<DiabetsState> {
  final ApiConsumer apiConsumer;
  DiabetsCubit(this.apiConsumer) : super(DiabetsInitial());

  void fetchDietData() async {
    emit(DiabetsLoading());
   try {
      final response = await apiConsumer.get(EndPoint.diabetsView);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<DiabetsModel> data = recipes
              .map((item) => DiabetsModel.fromJson(item)).take(6)
              .toList();

          emit(DiabetsSucess(data:data));
        } else {
          emit(DiabetsFailure(errMessage: "No data available"));
        }
      } else {
        emit(DiabetsFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(DiabetsFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(DiabetsFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}

