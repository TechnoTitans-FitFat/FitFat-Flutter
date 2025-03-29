class TargetBloodSugarRange {
  final int min;
  final int max;

  TargetBloodSugarRange({required this.min, required this.max});

  factory TargetBloodSugarRange.fromJson(Map<String, dynamic> json) {
    return TargetBloodSugarRange(
      min: json['min'],
      max: json['max'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }
}

class HealthInfo {
  final String id;
  final String userId;
  final String gender;
  final DateTime dateOfBirth;
  final double weight;
  final double height;
  final String foodAllergies;
  final bool diabetes;
  final String diabetesType;
  final double insulinToCarbRatio;
  final TargetBloodSugarRange targetBloodSugarRange;

  HealthInfo({
    required this.id,
    required this.userId,
    required this.gender,
    required this.dateOfBirth,
    required this.weight,
    required this.height,
    required this.foodAllergies,
    required this.diabetes,
    required this.diabetesType,
    required this.insulinToCarbRatio,
    required this.targetBloodSugarRange,
  });

  factory HealthInfo.fromJson(Map<String, dynamic> json) {
    final healthData = json['healthInfo'] ?? {};
    return HealthInfo(
      id: healthData['_id'],
      userId: healthData['userId'],
      gender: healthData['gender'],
      dateOfBirth: DateTime.parse(healthData['dateOfBirth']),
      weight: (healthData['weight'] as num).toDouble(),
      height: (healthData['height'] as num).toDouble(),
      foodAllergies: healthData['foodAllergies'],
      diabetes: healthData['diabetes'],
      diabetesType: healthData['diabetesType'],
      insulinToCarbRatio: (healthData['insulinToCarbRatio'] as num).toDouble(),
      targetBloodSugarRange: TargetBloodSugarRange.fromJson(healthData['targetBloodSugarRange']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'healthInfo': {
        '_id': id,
        'userId': userId,
        'gender': gender,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'weight': weight,
        'height': height,
        'foodAllergies': foodAllergies,
        'diabetes': diabetes,
        'diabetesType': diabetesType,
        'insulinToCarbRatio': insulinToCarbRatio,
        'targetBloodSugarRange': targetBloodSugarRange.toJson(),
      }
    };
  }
}
