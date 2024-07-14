import 'package:smart_pay/features/features.dart';

class AuthResponseModel extends AuthResponseEntity {
  AuthResponseModel({
    super.token,
    super.user,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'],
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }
}

class User extends UserEntity {
  User({
    super.country,
    super.email,
    super.fullName,
    super.userId,
    super.userName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      country: json['country'],
      email: json['email'],
      fullName: json['full_name'],
      userId: json['id'],
      userName: json['username'],
    );
  }
}
