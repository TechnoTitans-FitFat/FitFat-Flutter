import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/vegan_state.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VeganCubit extends Cubit<VeganState> {
  final ApiConsumer apiConsumer;

  VeganCubit(this.apiConsumer) : super(VeganInitial());

  Future<void> fetchVeganData() async {
    emit(VeganLoading());

    try {
      final response = await apiConsumer.get(
        EndPoint.veganView
      );

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final recipes = response['recipes'];

        if (recipes is List) {
          final List<DietModel> data = recipes
              .cast<Map<String, dynamic>>() 
              .map((item) => DietModel.fromJson(item))
              .take(10) 
              .toList();

          if (data.isNotEmpty) {
            emit(VeganSuccess(data: data));
          } else {
            emit(VeganFailure(errMessage: "No diet recipes found."));
          }
        } else {
          emit(VeganFailure(errMessage: "Invalid API response format (Expected List)."));
        }
      } else {
        emit(VeganFailure(errMessage: "Unexpected API response structure."));
      }
    } on ServerException catch (e) {
      emit(VeganFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(VeganFailure(errMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
