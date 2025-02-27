
class SignUpModel {
  final String message;
  final bool statusCode;
  final String id;

  SignUpModel(
      {required this.message, required this.statusCode, required this.id});

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
        message: jsonData['message'],
        statusCode: jsonData['status'],
        id: jsonData['_id']);
  }
}
