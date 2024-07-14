import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, String>> getEmailToken(String email);
  Future<Either<Failure, void>> verifyEmailToken(Map<String, dynamic> params);
  Future<Either<Failure, AuthResponseEntity>> register(AuthParams params);
  Future<Either<Failure, AuthResponseEntity>> login(AuthParams params);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> savePin(String pin);
  Future<Either<Failure, void>> verifyPin(String pin);
}
