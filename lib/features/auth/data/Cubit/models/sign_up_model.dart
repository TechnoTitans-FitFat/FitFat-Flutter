class SignUpModel {
  final bool statusCode;
  final String id;
  final String email;
  final String otp;

  SignUpModel({
  
    required this.statusCode,
    required this.id,
    required this.email,
    required this.otp,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
    //  message: jsonData['message'] ?? 'No message',
      statusCode: json['status'] ?? false,
      id: json['userId'] ?? 'No ID',
      email: json['email'] ?? '',
      otp: json['otp'].toString(),
    );
  }
}

