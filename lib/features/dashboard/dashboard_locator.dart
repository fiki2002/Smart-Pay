import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

void dashboardLocator() {
  getIt.registerLazySingleton<DashboardDatasource>(
    () => DashboardDatasourceImpl(),
  );

  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      dashboardDatasource: getIt<DashboardDatasource>(),
    ),
  );

  getIt.registerLazySingleton<FetchSecretMessageUsecase>(
    () => FetchSecretMessageUsecase(
      dashboardRepository: getIt<DashboardRepository>(),
    ),
  );

  getIt.registerLazySingleton<LogoutUsecase>(
    () => LogoutUsecase(
      authRepository: getIt<AuthenticationRepository>(),
    ),
  );

  getIt.registerLazySingleton<DashboardNotifier>(
    () => DashboardNotifier(
      fetchSecretMessageUsecase: getIt<FetchSecretMessageUsecase>(),
      logoutUsecase: getIt<LogoutUsecase>(),
    ),
  );
}
