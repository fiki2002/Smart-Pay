import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class RegisterUsecase
    implements UseCaseFuture<Failure, AuthResponseEntity, AuthParams> {
  final AuthenticationRepository _authRepository;

  const RegisterUsecase({
    required AuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, AuthResponseEntity>> call(AuthParams params) async {
    return await _authRepository.register(params);
  }
}
