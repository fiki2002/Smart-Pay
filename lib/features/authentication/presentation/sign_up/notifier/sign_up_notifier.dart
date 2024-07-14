import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SignUpNotifier extends ChangeNotifier {
  final GetEmailTokenUsecase _getEmailTokenUsecase;
  final VerifyEmailTokenUsecase _verifyEmailTokenUsecase;
  final RegisterUsecase _registerUserUsecase;

  SignUpNotifier({
    required GetEmailTokenUsecase getEmailTokenUsecase,
    required VerifyEmailTokenUsecase verifyEmailTokenUsecase,
    required RegisterUsecase registerUserUsecase,
  })  : _getEmailTokenUsecase = getEmailTokenUsecase,
        _verifyEmailTokenUsecase = verifyEmailTokenUsecase,
        _registerUserUsecase = registerUserUsecase;

  final BuildContext _context = navigatorKey.currentContext!;
  final SessionManager _sessionManager = getIt<SessionManager>();

  String? _email;
  String get email => _email ?? '';

  void updateEmail(String? value) {
    _email = value;
    notifyListeners();
  }

  void getEmailToken({bool shouldNavigate = true}) async {
    LoadingWidget.show(_context);
    final res = await _getEmailTokenUsecase(_email!);

    goBack();
    res.fold(
      (l) {
        Toast.showErrorToast(message: l.message);
      },
      (r) {
        if (shouldNavigate) {
          goTo(VerifyItsYouView.route);
        }
        Toast.showSuccessToast(
          message: 'Enter $r to get verified',
          duration: const Duration(minutes: 2),
        );
      },
    );
  }

  String? _token;
  void updateToken(String? value) async {
    _token = value;
    notifyListeners();
  }

  void verifyEmailToken() async {
    LoadingWidget.show(_context);

    final Map<String, dynamic> body = {'email': _email, 'token': _token};

    final res = await _verifyEmailTokenUsecase(body);

    goBack();

    res.fold(
      (l) {
        Toast.showErrorToast(message: l.message);
      },
      (r) {
        goTo(GetMoreInfoOnUserView.route);
      },
    );
  }

  Map<String, dynamic> _signUpData = {
    'email': '',
    'password': '',
  };

  void _resetSignUpData() {
    _signUpData = {
      'fullName': '',
      'username': '',
      'password': '',
    };
    notifyListeners();
  }

  /// This collects data from the [UserInfoDetailsForm] which will be used to authenticate
  /// the user
  void updateSignUpData(var key, var value) {
    if (_signUpData.containsKey(key)) {
      _signUpData.update(key, (_) => value);
    } else {
      _signUpData.putIfAbsent(key, () => value);
    }
    notifyListeners();
  }

  void register() async {
    LoadingWidget.show(_context);

    final deviceName = await getDeviceName();

    final params = AuthParams(
      email: _email!,
      deviceName: deviceName,
      password: _signUpData['password'],
      country: _selectedCountry?.countryCode ?? '',
      fullName: _signUpData['fullName'],
      userName: _signUpData['username'],
    );

    final res = await _registerUserUsecase(params);

    goBack();

    res.fold(
      (l) {
        Toast.showErrorToast(message: l.message);
      },
      (r) async {
        await _sessionManager.setUserAuthStatus(UserAuthStatus.loggedInNoPin);
        await _sessionManager.setToken(r.token ?? '');
        await _sessionManager.saveFullName(r.user?.userName ?? '');
        _resetSignUpData();
        clearRoad(SetPinCodeView.route, arguments: false);
      },
    );
  }

  final List<Country> _countries = Country.countries;
  List<Country> _filteredCountries = Country.countries;

  List<Country> get filteredCountries => _filteredCountries;

  void onChanged(String? query) {
    if (query?.isNotEmpty ?? false) {
      _filteredCountries = _countries.where((country) {
        return country.name.toLowerCase().contains(query!.toLowerCase());
      }).toList();
      notifyListeners();
    } else {
      _filteredCountries = _countries;
    }
  }

  Country? _selectedCountry;
  Country? get selectedCountry => _selectedCountry;

  void selectCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }
}
