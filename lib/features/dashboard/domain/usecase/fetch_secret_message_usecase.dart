import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class FetchSecretMessageUsecase
    implements UseCaseFuture<Failure, String, NoParams> {
  final DashboardRepository _dashboardRepository;

  const FetchSecretMessageUsecase({
    required DashboardRepository dashboardRepository,
  }) : _dashboardRepository = dashboardRepository;

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await _dashboardRepository.fetchSecretMessage();
  }
}
