import 'dart:async';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:smart_pay/core/core.dart';

mixin RepositoryExceptionHandler {
  Future<Either<Failure, T>> callAction<T>(
    Future<T> Function() action,
  ) async {
    try {
      final result = await action();
      return Right(result);
    } on NoGoogleAccountChosenException {
      return Either.left(
        const BaseFailures(
          message: 'User cancelled operation',
        ),
      );
    } on SocketException {
      return const Left(SocketFailures(message: ErrorText.noInternet));
    } on TimeoutException {
      return const Left(BaseFailures(message: ErrorText.timeOutError));
    } catch (e, s) {
      AppLogger.log(e, s);
      if (e is BaseFailures) {
        return Left(BaseFailures(message: e.message));
      }

      return Left(BaseFailures(message: e.toString()));
    }
  }

  Stream<Either<Failure, T>> callStreamAction<T>(
    Stream<T> Function() action,
  ) async* {
    try {
      final stream = action();

      await for (final result in stream) {
        yield Right(result);
      }
    } on SocketException {
      yield const Left(SocketFailures(message: ErrorText.noInternet));
    } on TimeoutException {
      yield const Left(BaseFailures(message: ErrorText.timeOutError));
    } catch (e, s) {
      AppLogger.log(e, s);
      if (e is BaseFailures) {
        yield Left(BaseFailures(message: e.message));
      } else {
        yield Left(BaseFailures(message: e.toString()));
      }
    }
  }
}
