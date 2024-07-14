import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/dashboard/dashboard_locator.dart';
import 'package:smart_pay/features/features.dart';

final GetIt getIt = GetIt.instance;

class SetUpLocators {
  static const SetUpLocators _instance = SetUpLocators._();
  const SetUpLocators._();
  factory SetUpLocators() => _instance;

  static Future<void> init() async {
    /// Session Manager
    await _instance._sessionManagerLocator();

    /// Authentication
    authLocator();

    /// Dashboard
    dashboardLocator();
  }

  Future<void> _sessionManagerLocator() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    getIt.registerLazySingleton<HttpHelper>(
      () => HttpHelper(),
    );

    getIt.registerLazySingleton<SessionManager>(
      () => SessionManager(),
    );

    getIt.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );

    getIt.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );
  }
}
