
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/diet_state.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class DietCubit extends Cubit<DietState> {
  final ApiConsumer apiConsumer;
  DietCubit(this.apiConsumer) : super(DietInitial());

  void fetchDietData() async {
    emit(DietLoading());
   try {
      final response = await apiConsumer.get(EndPoint.dietview);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<DietModel> data = recipes
              .map((item) => DietModel.fromJson(item)).take(6)
              .toList();

          emit(DietSucess(data:data));
        } else {
          emit(DietFailure(errMessage: "No data available"));
        }
      } else {
        emit(DietFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(DietFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(DietFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}

