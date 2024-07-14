class AuthResponseEntity {
  final UserEntity? user;
  final String? token;
  AuthResponseEntity({
    this.user,
    this.token,
  });

  @override
  String toString() => 'AuthResponseEntity(user: $user, token: $token)';
}

class UserEntity {
  final String? fullName;
  final String? userName;
  final String? email;
  final String? country;
  final String? userId;
  final String? phoneCountry;
  final String? avatar;
  final String? phone;
  UserEntity({
    this.fullName,
    this.userName,
    this.email,
    this.country,
    this.userId,
    this.phoneCountry,
    this.avatar,
    this.phone,
  });

  @override
  String toString() {
    return 'UserEntity(fullName: $fullName, userName: $userName, email: $email, country: $country, userId: $userId, phoneCountry: $phoneCountry, avatar: $avatar, phone: $phone)';
  }
}
