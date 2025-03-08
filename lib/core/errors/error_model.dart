class ErrorModel {
  final int status;
  final String errMessage;

  ErrorModel({required this.status, required this.errMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData['status'],
      errMessage: jsonData['message'],
    );
  }

  factory ErrorModel.fromString(String message) {
    return ErrorModel(
      status: 0, // Default or unknown status
      errMessage: message,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': errMessage,
    };
  }
}
