import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SetPinCodeNotifier extends ChangeNotifier {
  final SavePinUsecase _savePinUsecase;
  final VerifyPinUsecase _verifyPinUsecase;

  SetPinCodeNotifier({
    required SavePinUsecase savePinUsecase,
    required VerifyPinUsecase verifyPinUsecase,
  })  : _savePinUsecase = savePinUsecase,
        _verifyPinUsecase = verifyPinUsecase;

  final SessionManager _sessionManager = getIt<SessionManager>();
  final BuildContext _context = navigatorKey.currentContext!;

  String get userName => (_sessionManager.fetchFullName ?? '');

  String? _pin;

  void updatePin(String? value) {
    _pin = value;
    notifyListeners();
  }

  void setPin() async {
    LoadingWidget.show(_context);

    final res = await _savePinUsecase(_pin!);

    res.fold(
      (l) {
        Toast.showErrorToast(
          message: 'Something went wrong while setting pin, Try again.',
        );
      },
      (r) {
        _sessionManager.setUserAuthStatus(UserAuthStatus.loggedInWithPin);

        goTo(PinSetSuccessView.route);

        Toast.showSuccessToast(message: 'Pin set successfully!');
      },
    );
  }

  String? _inputtedPin;

  void updateInputtedPin(String? value) {
    _inputtedPin = value;
    notifyListeners();
  }

  void verifyPin() async {
    final res = await _verifyPinUsecase(_inputtedPin!);

    res.fold(
      (l) {
        Toast.showErrorToast(message: l.message);
      },
      (r) {
        clearRoad(DashboardView.route);
      },
    );
  }
}
