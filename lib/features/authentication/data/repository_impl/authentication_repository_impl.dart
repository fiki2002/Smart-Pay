import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class AuthRepositoryImpl extends AuthenticationRepository
    with RepositoryExceptionHandler {
  final AuthenticationDatasource _authenticationDatasource;

  AuthRepositoryImpl({
    required AuthenticationDatasource authenticationDatasource,
  }) : _authenticationDatasource = authenticationDatasource;

  @override
  Future<Either<Failure, String>> getEmailToken(String email) async {
    return callAction(
      () async => await _authenticationDatasource.getEmailToken(email),
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(AuthParams params) async {
    return callAction(
      () async => await _authenticationDatasource.login(params),
    );
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return callAction(
      () async => await _authenticationDatasource.logout(),
    );
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> register(AuthParams params) {
    return callAction(
      () async => await _authenticationDatasource.register(params),
    );
  }

  @override
  Future<Either<Failure, void>> verifyEmailToken(Map<String, dynamic> params) {
    return callAction(
      () async => await _authenticationDatasource.verifyEmailToken(params),
    );
  }

  @override
  Future<Either<Failure, void>> savePin(String pin) async {
    return callAction(() async => await _authenticationDatasource.savePin(pin));
  }

  @override
  Future<Either<Failure, void>> verifyPin(String pin) {
    return callAction(() async => await _authenticationDatasource.verifyPin(pin));
  }
}
