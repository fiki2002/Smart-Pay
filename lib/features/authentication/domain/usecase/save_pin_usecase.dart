import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SavePinUsecase implements UseCaseVoid<Failure, String> {
  final AuthenticationRepository _authRepository;

  const SavePinUsecase({
    required AuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(String params) {
    return _authRepository.savePin(params);
  }
}
