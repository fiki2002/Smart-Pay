import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/dashboard/dashboard.dart';
import 'package:smart_pay/features/features.dart';

class DashboardRepositoryImpl extends DashboardRepository
    with RepositoryExceptionHandler {
  final DashboardDatasource _dashboardDatasource;

  DashboardRepositoryImpl({
    required DashboardDatasource dashboardDatasource,
  }) : _dashboardDatasource = dashboardDatasource;

  @override
  Future<Either<Failure, String>> fetchSecretMessage() async {
    return callAction(
      () async => await _dashboardDatasource.fetchSecretMessage(),
    );
  }
}
