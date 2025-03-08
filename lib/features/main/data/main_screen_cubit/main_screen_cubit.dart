import 'package:equatable/equatable.dart';
import 'package:fitfat/core/api/api_consumer.dart';
import 'package:fitfat/core/api/end_points.dart';
import 'package:fitfat/core/errors/exceptions.dart';
import 'package:fitfat/features/main/data/models/main_screen_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  final ApiConsumer apiConsumer;
  MainScreenCubit(this.apiConsumer) : super(MainScreenInitial());

  void fetchMainScreenData() async {
    emit(MainScreenLoading());
   try {
      final response = await apiConsumer.get(EndPoint.home);

      if (response is Map<String, dynamic> && response.containsKey('recipes')) {
        final List<dynamic> recipes = response['recipes'];

        if (recipes.isNotEmpty) {
          final List<MainScreenModel> data = recipes
              .map((item) => MainScreenModel.fromJson(item)).take(6)
              .toList();

          emit(MainScreenSucess(data: data));
        } else {
          emit(MainScreenFailure(errMessage: "No data available"));
        }
      } else {
        emit(MainScreenFailure(errMessage: "Invalid API response format"));
      }
    } on ServerException catch (e) {
      emit(MainScreenFailure(errMessage: e.errModel.errMessage));
    } catch (e) {
      emit(MainScreenFailure(errMessage: "Unexpected error: ${e.toString()}"));
    }
  }
}

