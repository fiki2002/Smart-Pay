import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class VerifyPinUsecase implements UseCaseVoid<Failure, String> {
  final AuthenticationRepository _authRepository;

  const VerifyPinUsecase({
    required AuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(String params) {
    return _authRepository.verifyPin(params);
  }
}
