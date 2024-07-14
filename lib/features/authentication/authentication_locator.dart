import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

void authLocator() {
  getIt.registerLazySingleton<AuthenticationDatasource>(
    () => AuthenticationDatasourceImpl(),
  );

  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthRepositoryImpl(
      authenticationDatasource: getIt<AuthenticationDatasource>(),
    ),
  );

  getIt.registerLazySingleton<GetEmailTokenUsecase>(
    () => GetEmailTokenUsecase(
      authRepository: getIt<AuthenticationRepository>(),
    ),
  );

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      authRepository: getIt<AuthenticationRepository>(),
    ),
  );

  getIt.registerLazySingleton<VerifyEmailTokenUsecase>(
    () => VerifyEmailTokenUsecase(
      authRepository: getIt<AuthenticationRepository>(),
    ),
  );

  getIt.registerLazySingleton<RegisterUsecase>(
    () => RegisterUsecase(
      authRepository: getIt<AuthenticationRepository>(),
    ),
  );
  getIt.registerLazySingleton<SavePinUsecase>(
    () => SavePinUsecase(
      authRepository: getIt<AuthenticationRepository>(),
    ),
  );

  getIt.registerLazySingleton<VerifyPinUsecase>(
    () => VerifyPinUsecase(
      authRepository: getIt<AuthenticationRepository>(),
    ),
  );
  getIt.registerLazySingleton<SignInNotifier>(
    () => SignInNotifier(
      loginUsecase: getIt<LoginUsecase>(),
    ),
  );

  getIt.registerLazySingleton<SetPinCodeNotifier>(
    () => SetPinCodeNotifier(
      savePinUsecase: getIt<SavePinUsecase>(),
      verifyPinUsecase: getIt<VerifyPinUsecase>(),
    ),
  );

  getIt.registerLazySingleton<SignUpNotifier>(
    () => SignUpNotifier(
      registerUserUsecase: getIt<RegisterUsecase>(),
      getEmailTokenUsecase: getIt<GetEmailTokenUsecase>(),
      verifyEmailTokenUsecase: getIt<VerifyEmailTokenUsecase>(),
    ),
  );
}
