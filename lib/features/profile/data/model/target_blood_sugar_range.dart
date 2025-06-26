// models/user_profile_model.dart

class TargetBloodSugarRange {
  final double min;
  final double max;

  TargetBloodSugarRange({
    required this.min,
    required this.max,
  });

  factory TargetBloodSugarRange.fromJson(Map<String, dynamic> json) {
    return TargetBloodSugarRange(
      min: (json['min'] ?? 0).toDouble(),
      max: (json['max'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }

  TargetBloodSugarRange copyWith({
    double? min,
    double? max,
  }) {
    return TargetBloodSugarRange(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }
}
