import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class LogoutUsecase implements UseCaseVoid<Failure, NoParams> {
  final AuthenticationRepository _authRepository;

  const LogoutUsecase({
    required AuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _authRepository.logout();
  }
}
