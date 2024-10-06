

class ErrorResponse {
  final bool? success;
  final String? message;
  // final Errors? errors;
  final List<dynamic>? data;

  ErrorResponse({
     this.success,
    this.message,
      // this.errors,
     this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      success: json['success'],
      message: json['message'],
      //  errors: Errors.fromJson(json['errors']),
      data: List<dynamic>.from(json['data']),
    );
  }

 
}

class Errors {
  final List<String>? email;
  final List<String>? phone;

  Errors({
     this.email,
     this.phone,
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
