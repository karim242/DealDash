class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });
    User user;
    String token;
  
  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
   
  }
  
}

class User {
  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
    String name;
    String email;
    String phone;
    String updatedAt;
    String createdAt;
    int id;
  
 factory User.fromJson(Map<String, dynamic> json){
    return User(
    name :json['name'],
    email: json['email'],
    phone: json['phone'],
    updatedAt :json['updated_at'],
    createdAt :json['created_at'],
    id : json['id']
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}