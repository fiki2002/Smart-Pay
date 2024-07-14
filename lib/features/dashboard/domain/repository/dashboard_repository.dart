import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';

abstract class DashboardRepository {
  Future<Either<Failure, String>> fetchSecretMessage();
}
