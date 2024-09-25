

class ErrorResponse {
  final bool success;
  final String? message;
  final Errors errors;
  final List<dynamic> data;

  ErrorResponse({
    required this.success,
    this.message,
    required this.errors,
    required this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      success: json['success'],
      message: json['message'],
      errors: Errors.fromJson(json['errors']),
      data: List<dynamic>.from(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'errors': errors.toJson(),
      'data': data,
    };
  }
}

class Errors {
  final List<String> email;
  final List<String> phone;

  Errors({
    required this.email,
    required this.phone,
  });

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
      email: List<String>.from(json['email']),
      phone: List<String>.from(json['phone']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
    };
  }
}
