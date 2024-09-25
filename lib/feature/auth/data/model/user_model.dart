class AuthResponse {
  final bool success;
  final String message;
  final List<dynamic> errors;
  final Data data;

  AuthResponse({
    required this.success,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'],
      message: json['message'],
      errors: List<dynamic>.from(json['errors']),
      data: Data.fromJson(json['data']),
    );
  }


}

class Data {
  final User user;
  final String token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

 
}

class User {
  final int id;
  final String name;
  final String email;
  final String? emailVerifiedAt;
  final String phone;
  final String? verificationCode;
  final String? phoneVerifiedAt;
  //final String role;
  final String? avatar;
  final String? fcmToken;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.phone,
    this.verificationCode,
    this.phoneVerifiedAt,
   // required this.role,
     this.avatar,
    this.fcmToken,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      phone: json['phone'],
      verificationCode: json['verification_code'],
      phoneVerifiedAt: json['phone_verified_at'],
    //  role: json['role'],
      avatar: json['avatar'],
      fcmToken: json['fcm_token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }


}
