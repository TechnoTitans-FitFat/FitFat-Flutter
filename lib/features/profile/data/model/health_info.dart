import 'package:fitfat/features/profile/data/model/target_blood_sugar_range.dart';

class HealthInfo {
  final TargetBloodSugarRange targetBloodSugarRange;
  final String id;
  final String userId;
  final String gender;
  final DateTime dateOfBirth;
  final double weight;
  final double height;
  final String foodAllergies;
  final bool diabetes;
  final String diabetesType;
  final double correctionFactor;
  final int version;

  HealthInfo({
    required this.targetBloodSugarRange,
    required this.id,
    required this.userId,
    required this.gender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.foodAllergies,
    required this.diabetes,
    required this.diabetesType,
    required this.correctionFactor,
    required this.version,
  });

  factory HealthInfo.fromJson(Map<String, dynamic> json) {
    return HealthInfo(
      targetBloodSugarRange:
          TargetBloodSugarRange.fromJson(json['targetBloodSugarRange'] ?? {}),
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      gender: json['gender'] ?? '',
      dateOfBirth:
          DateTime.tryParse(json['dateOfBirth'] ?? '') ?? DateTime.now(),
      weight: (json['weight'] ?? 0).toDouble(),
      height: (json['height'] ?? 0).toDouble(),
      foodAllergies: json['foodAllergies'] ?? '',
      diabetes: json['diabetes'] ?? false,
      diabetesType: json['diabetesType'] ?? '',
      correctionFactor: (json['correctionFactor'] ?? 0).toDouble(),
      version: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'targetBloodSugarRange': targetBloodSugarRange.toJson(),
      '_id': id,
      'userId': userId,
      'gender': gender,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'weight': weight,
      'height': height,
      'foodAllergies': foodAllergies,
      'diabetes': diabetes,
      'diabetesType': diabetesType,
      'correctionFactor': correctionFactor,
      '__v': version,
    };
  }

  HealthInfo copyWith({
    TargetBloodSugarRange? targetBloodSugarRange,
    String? id,
    String? userId,
    String? gender,
    DateTime? dateOfBirth,
    double? weight,
    double? height,
    String? foodAllergies,
    bool? diabetes,
    String? diabetesType,
    double? correctionFactor,
    int? version,
  }) {
    return HealthInfo(
      targetBloodSugarRange:
          targetBloodSugarRange ?? this.targetBloodSugarRange,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      foodAllergies: foodAllergies ?? this.foodAllergies,
      diabetes: diabetes ?? this.diabetes,
      diabetesType: diabetesType ?? this.diabetesType,
      correctionFactor: correctionFactor ?? this.correctionFactor,
      version: version ?? this.version,
    );
  }
}
