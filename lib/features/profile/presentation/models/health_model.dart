class GetHealthModel {
  final bool status;
  final HealthInfo? healthInfo;

  GetHealthModel({
    required this.status,
    this.healthInfo,
  });

  factory GetHealthModel.fromJson(Map<String, dynamic> json) {
    return GetHealthModel(
      status: json['status'] as bool? ?? false,
      healthInfo: json['healthInfo'] != null && json['healthInfo'] is Map
          ? HealthInfo.fromJson(json['healthInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class HealthInfo {
  final BloodSugarRange? targetBloodSugarRange;
  final String id;
  final String userId;
  final String gender;
  final String dateOfBirth;
  final int weight;
  final int height;
  final String foodAllergies;
  final bool diabetes;
  final String diabetesType;
  final int v;
  final double insulinToCarbRatio;
  final int? correctionFactor;

  HealthInfo({
    this.targetBloodSugarRange,
    required this.id,
    required this.userId,
    required this.gender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.foodAllergies,
    required this.diabetes,
    required this.diabetesType,
    required this.v,
    required this.insulinToCarbRatio,
    this.correctionFactor,
  });

  factory HealthInfo.fromJson(Map<String, dynamic> json) {
    return HealthInfo(
      targetBloodSugarRange: json['targetBloodSugarRange'] != null &&
          json['targetBloodSugarRange'] is Map
          ? BloodSugarRange.fromJson(json['targetBloodSugarRange'] as Map<String, dynamic>)
          : null,
      id: _parseString(json['_id']),
      userId: _parseString(json['userId']),
      gender: _parseString(json['gender'], defaultValue: 'Unknown'),
      dateOfBirth: _parseString(json['dateOfBirth']),
      weight: json['weight'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      foodAllergies: _parseString(json['foodAllergies']),
      diabetes: json['diabetes'] as bool? ?? false,
      diabetesType: _parseString(json['diabetesType']),
      v: json['__v'] as int? ?? 0,
      insulinToCarbRatio: (json['insulinToCarbRatio'] as num?)?.toDouble() ?? 0.0,
      correctionFactor: json['correctionFactor'] as int?,
    );
  }

  static String _parseString(dynamic value, {String defaultValue = ''}) {
    if (value == null) return defaultValue;
    if (value is String) return value;
    return value.toString();
  }
}

class BloodSugarRange {
  final int min;
  final int max;

  BloodSugarRange({
    required this.min,
    required this.max,
  });

  factory BloodSugarRange.fromJson(Map<String, dynamic> json) {
    return BloodSugarRange(
      min: json['min'] as int? ?? 0,
      max: json['max'] as int? ?? 0,
    );
  }
}