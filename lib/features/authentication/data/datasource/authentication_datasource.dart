import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

abstract class AuthenticationDatasource {
  Future<String> getEmailToken(String email);
  Future<void> verifyEmailToken(Map<String, dynamic> params);
  Future<AuthResponseModel> register(AuthParams params);
  Future<AuthResponseModel> login(AuthParams params);
  Future<void> logout();
  Future<void> savePin(String pin);
  Future<void> verifyPin(String pin);
}

class AuthenticationDatasourceImpl extends AuthenticationDatasource {
  final HttpHelper _httpHelper = getIt<HttpHelper>();
  final SessionManager _sessionManager = getIt<SessionManager>();

  @override
  Future<String> getEmailToken(String email) async {
    final res = await _httpHelper.post(
      url: getEmailTokenUrl,
      body: {
        'email': email,
      },
    );

    final token = res['data']['token'] as String;

    return token;
  }

  @override
  Future<AuthResponseModel> login(AuthParams params) async {
    final res = await _httpHelper.post(
      url: loginUrl,
      body: params.toJson(),
    );

    final token = AuthResponseModel.fromJson(
      res['data'] as Map<String, dynamic>,
    );

    return token;
  }

  @override
  Future<void> logout() async {
    await _httpHelper.post(url: logoutUrl);
  }

  @override
  Future<AuthResponseModel> register(AuthParams params) async {
    final res = await _httpHelper.post(
      url: registerUrl,
      body: params.toJson(),
    );

    final data = AuthResponseModel.fromJson(
      res['data'] as Map<String, dynamic>,
    );

    return data;
  }

  @override
  Future<void> verifyEmailToken(Map<String, dynamic> params) async {
    await _httpHelper.post(url: verifyEmailTokenUrl, body: params);
  }

  @override
  Future<void> savePin(String pin) async {
    await _sessionManager.savePin(pin);
  }

  @override
  Future<void> verifyPin(String pin) async {
    final res = await _sessionManager.fetchPin();

    if ((res?.isNotEmpty ?? false) && res == pin) {
      return;
    }
    throw const BaseFailures(message: 'Incorrect pin.');
  }
}
