import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/allergy_cubit/allergy_state.dart';
import 'package:fitfat/features/main/presentaion/allergy_category/data/models/allergy_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class AllregyCubit extends Cubit<AllergyState> {
  final ApiConsumer apiConsumer;
  AllregyCubit(this.apiConsumer) : super(AllergyInitial());

  void fetchAllergyData() async {
    emit(AllergyLoading());
   try {
      final response = await apiConsumer.get(EndPoint.allergyView);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<AllergyModel> data = recipes
              .map((item) => AllergyModel.fromJson(item)).take(6)
              .toList();

          emit(AllergySucess(data:data));
        } else {
          emit(AllergyFailure(errMessage: "No data available"));
        }
      } else {
        emit(AllergyFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(AllergyFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(AllergyFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}

