import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/shellfish_state.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShellfishCubit extends Cubit<ShellfishState> {
  final ApiConsumer apiConsumer;

  ShellfishCubit(this.apiConsumer) : super(ShellfishInitial());

  Future<void> fetchShellfishData() async {
    emit(ShellfishLoading());

    try {
      final response = await apiConsumer.get(
        EndPoint.shellFishView
      );

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final recipes = response['recipes'];

        if (recipes is List) {
          final List<AllergyModel> data = recipes
              .cast<Map<String, dynamic>>() 
              .map((item) => AllergyModel.fromJson(item))
              .take(6) 
              .toList();

          if (data.isNotEmpty) {
            emit(ShellfishSuccess(data: data));
          } else {
            emit(ShellfishFailure(errMessage: "No allergy recipes found."));
          }
        } else {
          emit(ShellfishFailure(errMessage: "Invalid API response format (Expected List)."));
        }
      } else {
        emit(ShellfishFailure(errMessage: "Unexpected API response structure."));
      }
    } on ServerException catch (e) {
      emit(ShellfishFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(ShellfishFailure(errMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
