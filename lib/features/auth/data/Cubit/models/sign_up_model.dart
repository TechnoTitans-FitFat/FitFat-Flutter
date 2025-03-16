class SignUpModel {
  final String message;
  final bool statusCode;
  final String id;
  final String email;
  final String otp;

  SignUpModel({
    required this.message,
    required this.statusCode,
    required this.id,
    required this.email,
    required this.otp,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      message: jsonData['message'] ?? 'No message',
      statusCode: jsonData['status'] ?? false,
      id: jsonData['userId'] ?? 'No ID',
      email: jsonData['email'] ?? '',
      otp: jsonData['otp'].toString(),
    );
  }
}

