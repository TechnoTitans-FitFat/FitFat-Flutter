import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/diet_cubit/keto_state.dart';
import 'package:fitfat/features/main/presentaion/diet_category/data/models/models/diet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KetoCubit extends Cubit<KetoState> {
  final ApiConsumer apiConsumer;

  KetoCubit(this.apiConsumer) : super(KetoInitial());

  Future<void> fetchKetoData() async {
    emit(KetoLoading());

    try {
      final response = await apiConsumer.get(
        EndPoint.ketoView
      );

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final recipes = response['recipes'];

        if (recipes is List) {
          final List<DietModel> data = recipes
              .cast<Map<String, dynamic>>() 
              .map((item) => DietModel.fromJson(item))
              .take(6) 
              .toList();

          if (data.isNotEmpty) {
            emit(KetoSuccess(data: data));
          } else {
            emit(KetoFailure(errMessage: "No diet recipes found."));
          }
        } else {
          emit(KetoFailure(errMessage: "Invalid API response format (Expected List)."));
        }
      } else {
        emit(KetoFailure(errMessage: "Unexpected API response structure."));
      }
    } on ServerException catch (e) {
      emit(KetoFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(KetoFailure(errMessage: "An error occurred: ${e.toString()}"));
    }
  }
}
