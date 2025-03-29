import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/peanuts_state.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeanutsCubit extends Cubit<PeanutsState> {
  final ApiConsumer apiConsumer;

  PeanutsCubit(this.apiConsumer) : super(PeanutsInitial());

  Future<void> fetchPeanutsData() async {
    emit(PeanutsLoading());

    try {
      final response = await apiConsumer.get(
        EndPoint.peanutsView
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
            emit(PeanutsSuccess(data: data));
          } else {
            emit(PeanutsFailure(errMessage: "No allergy recipes found."));
          }
        } else {
          emit(PeanutsFailure(errMessage: "Invalid API response format (Expected List)."));
        }
      } else {
        emit(PeanutsFailure(errMessage: "Unexpected API response structure."));
      }
    } on ServerException catch (e) {
      emit(PeanutsFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(PeanutsFailure(errMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
