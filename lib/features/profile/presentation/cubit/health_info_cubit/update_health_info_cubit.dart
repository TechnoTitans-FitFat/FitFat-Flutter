import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fitfat/features/profile/data/model/health_info.dart';
import 'package:equatable/equatable.dart';

part 'update_health_info_state.dart';

class UpdateHealthInfoCubit extends Cubit<UpdateHealthInfoState> {
  UpdateHealthInfoCubit() : super(UpdateHealthInfoInitial());

  // Fetch health information for a user
  Future<void> fetchHealthInfo(String id) async {
    try {
      emit(UpdateHealthInfoLoading());
      final response = await http.get(
        Uri.parse('https://fitfattt.azurewebsites.net/api/healthInfo/$id'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final healthInfo = HealthInfo.fromJson(data);
        emit(UpdateHealthInfoLoaded(healthInfo));
      } else {
        emit(const UpdateHealthInfoError('Failed to fetch health info'));
      }
    } catch (e) {
      emit(UpdateHealthInfoError('Error: $e'));
    }
  }

  // Update health information for a user
  Future<void> updateHealthInfo(String id, HealthInfo healthInfo) async {
    try {
      emit(UpdateHealthInfoLoading());
      final response = await http.put(
        Uri.parse('https://fitfattt.azurewebsites.net/api/healthInfo/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(healthInfo.toJson()),
      );

      if (response.statusCode == 200) {
        emit(UpdateHealthInfoLoaded(healthInfo));
      } else {
        emit(const UpdateHealthInfoError('Failed to update health info'));
      }
    } catch (e) {
      emit(UpdateHealthInfoError('Error: $e'));
    }
  }
}

class HealthInfo extends Equatable {
  final String foodAllergies;
  final bool diabetes;
  final int weight;
  final int height;
  final DateTime dateOfBirth;
  final String gender;
  final BloodSugarRange targetBloodSugarRange;
  final String diabetesType;
  final double insulinToCarbRatio;
  final double correctionFactor;

  const HealthInfo({
    required this.foodAllergies,
    required this.diabetes,
    required this.weight,
    required this.height,
    required this.dateOfBirth,
    required this.gender,
    required this.targetBloodSugarRange,
    required this.diabetesType,
    required this.insulinToCarbRatio,
    required this.correctionFactor,
  });

  factory HealthInfo.fromJson(Map<String, dynamic> json) {
    return HealthInfo(
      foodAllergies: json['foodAllergies'] as String,
      diabetes: json['diabetes'] as bool,
      weight: json['weight'] as int,
      height: json['height'] as int,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String,
      targetBloodSugarRange:
          BloodSugarRange.fromJson(json['targetBloodSugarRange']),
      diabetesType: json['diabetesType'] as String,
      insulinToCarbRatio: (json['insulinToCarbRatio'] as num).toDouble(),
      correctionFactor: (json['correctionFactor'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodAllergies': foodAllergies,
      'diabetes': diabetes,
      'weight': weight,
      'height': height,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'gender': gender,
      'targetBloodSugarRange': targetBloodSugarRange.toJson(),
      'diabetesType': diabetesType,
      'insulinToCarbRatio': insulinToCarbRatio,
      'correctionFactor': correctionFactor,
    };
  }

  @override
  List<Object> get props => [
        foodAllergies,
        diabetes,
        weight,
        height,
        dateOfBirth,
        gender,
        targetBloodSugarRange,
        diabetesType,
        insulinToCarbRatio,
        correctionFactor,
      ];
}

class BloodSugarRange extends Equatable {
  final int min;
  final int max;

  const BloodSugarRange({
    required this.min,
    required this.max,
  });

  factory BloodSugarRange.fromJson(Map<String, dynamic> json) {
    return BloodSugarRange(
      min: json['min'] as int,
      max: json['max'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }

  @override
  List<Object> get props => [min, max];
}
