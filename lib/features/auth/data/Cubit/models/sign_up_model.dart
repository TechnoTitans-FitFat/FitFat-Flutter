class SignUpModel {
  final bool statusCode;
  final String? message;
  final String? userId;

  SignUpModel({
    required this.statusCode,
    this.message,
    this.userId,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      statusCode: json['status'] ?? false,
      message: json['message'],
      userId: json['userId'],
    );
  }
}
