import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class GetEmailTokenUsecase implements UseCaseFuture<Failure, String, String> {
  final AuthenticationRepository _authRepository;

  const GetEmailTokenUsecase({
    required AuthenticationRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, String>> call(String params) async {
    return await _authRepository.getEmailToken(params);
  }
}
