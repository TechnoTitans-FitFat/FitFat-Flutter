import 'package:fitfat/features/profile/data/model/macronutrient_goals.dart';

class DietInfo {
  final MacronutrientGoals macronutrientGoals;
  final String id;
  final String userId;
  final String dietType;
  final String dietaryGoals;
  final String activityLevel;
  final String mealPreferences;
  final int version;

  DietInfo({
    required this.macronutrientGoals,
    required this.id,
    required this.userId,
    required this.dietType,
    required this.dietaryGoals,
    required this.activityLevel,
    required this.mealPreferences,
    required this.version,
  });

  factory DietInfo.fromJson(Map<String, dynamic> json) {
    return DietInfo(
      macronutrientGoals:
          MacronutrientGoals.fromJson(json['macronutrientGoals'] ?? {}),
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      dietType: json['dietType'] ?? '',
      dietaryGoals: json['dietaryGoals'] ?? '',
      activityLevel: json['activityLevel'] ?? '',
      mealPreferences: json['mealPreferences'] ?? '',
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'macronutrientGoals': macronutrientGoals.toJson(),
      '_id': id,
      'userId': userId,
      'dietType': dietType,
      'dietaryGoals': dietaryGoals,
      'activityLevel': activityLevel,
      'mealPreferences': mealPreferences,
      '__v': version,
    };
  }

  DietInfo copyWith({
    MacronutrientGoals? macronutrientGoals,
    String? id,
    String? userId,
    String? dietType,
    String? dietaryGoals,
    String? activityLevel,
    String? mealPreferences,
    int? version,
  }) {
    return DietInfo(
      macronutrientGoals: macronutrientGoals ?? this.macronutrientGoals,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      dietType: dietType ?? this.dietType,
      dietaryGoals: dietaryGoals ?? this.dietaryGoals,
      activityLevel: activityLevel ?? this.activityLevel,
      mealPreferences: mealPreferences ?? this.mealPreferences,
      version: version ?? this.version,
    );
  }
}
