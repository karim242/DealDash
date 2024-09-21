class ErrorModel {
  final String message;
  final String? code;
  ErrorModel({
    required this.message,
    this.code,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'],
      code: json['code'],
    );
  }
}
