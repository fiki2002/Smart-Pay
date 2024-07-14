import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_pay/core/core.dart';

class SessionManager {
  final FlutterSecureStorage _flutterSecureStorage =
      getIt<FlutterSecureStorage>();
  final SharedPreferences _sharedPreferences = getIt<SharedPreferences>();

  Future<void> setToken(String token) {
    return _flutterSecureStorage.write(
      key: tokenKey,
      value: token,
    );
  }

  Future<String> getToken() async {
    final String? value = await _flutterSecureStorage.read(key: tokenKey);
    return value ?? '';
  }

  Future<bool> saveFullName(String name) async {
    return _sharedPreferences.setString(userFullNameKey, name);
  }

  Future<bool> setUserAuthStatus(UserAuthStatus value) async {
    return _sharedPreferences.setInt(userAuthStatusKey, value.index);
  }

  UserAuthStatus? get userAuthStatus {
    return UserAuthStatus
        .values[_sharedPreferences.getInt(userAuthStatusKey) ?? 0];
  }

  Future<void> savePin(String pin) async {
    return _flutterSecureStorage.write(key: authPinKey, value: pin);
  }

  Future<String?> fetchPin() async {
    return _flutterSecureStorage.read(key: authPinKey);
  }

  String? get fetchFullName {
    return _sharedPreferences.getString(userFullNameKey);
  }

  Future<void> clearStorage() async {
    await _sharedPreferences.clear();
    await _flutterSecureStorage.write(
      key: tokenKey,
      value: null,
    );
  }
}

enum UserAuthStatus {
  notLoggedIn,
  loggedInNoPin,
  loggedIn,
  loggedInWithPin,
  onboard,
}
