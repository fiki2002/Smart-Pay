class AuthParams {
  final String? fullName;
  final String? userName;
  final String email;
  final String? country;
  final String password;
  final String deviceName;
  AuthParams({
    this.fullName,
    this.userName,
    required this.email,
    this.country,
    required this.password,
    required this.deviceName,
  });

  @override
  String toString() {
    return 'AuthParams(fullName: $fullName, userName: $userName,'
        ' email: $email, country: $country, password: $password, deviceNme: $deviceName)';
  }

  Map<String, dynamic> toJson() {
    return {
      if (fullName != null) 'full_name': fullName,
      if (userName != null) 'username': userName,
      'email': email,
      if (country != null) 'country': country,
      'password': password,
      'device_name': deviceName,
    };
  }
}
