import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitfat/features/profile/data/model/diet_info.dart';
import 'package:equatable/equatable.dart';
part 'update_diet_info_state.dart';

class UpdateDietInfoCubit extends Cubit<UpdateDietInfoState> {
  UpdateDietInfoCubit() : super(UpdateDietInfoInitial());

  // Fetch diet information for a user
  Future<void> fetchDietInfo(String id) async {
    try {
      emit(UpdateDietInfoLoading());
      final response = await http.get(
        Uri.parse('https://fitfattt.azurewebsites.net/api/dietInfo/$id'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final dietInfo = DietInfo.fromJson(data);
        emit(UpdateDietInfoLoaded(dietInfo));
      } else {
        emit(const UpdateDietInfoError('Failed to fetch diet info'));
      }
    } catch (e) {
      emit(UpdateDietInfoError('Error: $e'));
    }
  }

  // Update diet information for a user
  Future<void> updateDietInfo(String id, DietInfo dietInfo) async {
    try {
      emit(UpdateDietInfoLoading());
      final response = await http.put(
        Uri.parse('https://fitfattt.azurewebsites.net/api/dietInfo/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dietInfo.toJson()),
      );

      if (response.statusCode == 200) {
        emit(UpdateDietInfoLoaded(dietInfo));
      } else {
        emit(const UpdateDietInfoError('Failed to update diet info'));
      }
    } catch (e) {
      emit(UpdateDietInfoError('Error: $e'));
    }
  }
}

class DietInfo extends Equatable {
  final String dietType;
  final MacronutrientGoals macronutrientGoals;
  final String dietaryGoals;
  final String activityLevel;
  final String mealPreferences;

  const DietInfo({
    required this.dietType,
    required this.macronutrientGoals,
    required this.dietaryGoals,
    required this.activityLevel,
    required this.mealPreferences,
  });

  factory DietInfo.fromJson(Map<String, dynamic> json) {
    return DietInfo(
      dietType: json['dietType'] as String,
      macronutrientGoals:
          MacronutrientGoals.fromJson(json['macronutrientGoals']),
      dietaryGoals: json['dietaryGoals'] as String,
      activityLevel: json['activityLevel'] as String,
      mealPreferences: json['mealPreferences'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dietType': dietType,
      'macronutrientGoals': macronutrientGoals.toJson(),
      'dietaryGoals': dietaryGoals,
      'activityLevel': activityLevel,
      'mealPreferences': mealPreferences,
    };
  }

  @override
  List<Object> get props => [
        dietType,
        macronutrientGoals,
        dietaryGoals,
        activityLevel,
        mealPreferences,
      ];
}

class MacronutrientGoals extends Equatable {
  final int proteins;
  final int carbs;
  final int fats;
  final int calories;

  const MacronutrientGoals({
    required this.proteins,
    required this.carbs,
    required this.fats,
    required this.calories,
  });

  factory MacronutrientGoals.fromJson(Map<String, dynamic> json) {
    return MacronutrientGoals(
      proteins: json['proteins'] as int,
      carbs: json['carbs'] as int,
      fats: json['fats'] as int,
      calories: json['calories'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'proteins': proteins,
      'carbs': carbs,
      'fats': fats,
      'calories': calories,
    };
  }

  @override
  List<Object> get props => [proteins, carbs, fats, calories];
}
