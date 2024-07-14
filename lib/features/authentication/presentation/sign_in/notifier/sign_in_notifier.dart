import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SignInNotifier extends ChangeNotifier {
  final LoginUsecase _loginUsecase;

  SignInNotifier({
    required LoginUsecase loginUsecase,
  }) : _loginUsecase = loginUsecase;

  final BuildContext _context = navigatorKey.currentContext!;
  final SessionManager _sessionManager = getIt<SessionManager>();

  Map<String, dynamic> _signInData = {
    'email': '',
    'password': '',
  };

  void _resetSignInData() {
    _signInData = {
      'password': '',
      'email': '',
    };
    notifyListeners();
  }

  /// This collects data from the [SignInForm] which will be used to authenticate
  /// the user
  void updateSignInData(var key, var value) {
    if (_signInData.containsKey(key)) {
      _signInData.update(key, (_) => value);
    } else {
      _signInData.putIfAbsent(key, () => value);
    }
    notifyListeners();
  }

  /// This allows the the user sign into the app with their email and password
  void login() async {
    LoadingWidget.show(_context);

    final deviceName = await getDeviceName();

    final params = AuthParams(
      email: _signInData['email'],
      password: _signInData['password'],
      deviceName: deviceName,
    );

    final res = await _loginUsecase(params);

    goBack();
    res.fold(
      (l) {
        Toast.showErrorToast(message: l.message);
      },
      (r) async {
        await _sessionManager.setUserAuthStatus(UserAuthStatus.loggedIn);
        await _sessionManager.setToken(r.token ?? '');
        await _sessionManager.saveFullName(r.user?.userName ?? '');
        _resetSignInData();
        goTo(DashboardView.route);
      },
    );
  }
}
