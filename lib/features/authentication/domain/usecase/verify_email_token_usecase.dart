import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class VerifyEmailTokenUsecase
    implements UseCaseVoid<Failure, Map<String, dynamic>> {
  final AuthenticationRepository _authRepository;

  const VerifyEmailTokenUsecase({
    required AuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    return await _authRepository.verifyEmailToken(params);
  }
}
