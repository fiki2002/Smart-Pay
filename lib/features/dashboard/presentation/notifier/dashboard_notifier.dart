import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class DashboardNotifier extends ChangeNotifier {
  final FetchSecretMessageUsecase _fetchSecretMessageUsecase;
  final LogoutUsecase _logoutUsecase;

  DashboardNotifier({
    required FetchSecretMessageUsecase fetchSecretMessageUsecase,
    required LogoutUsecase logoutUsecase,
  })  : _fetchSecretMessageUsecase = fetchSecretMessageUsecase,
        _logoutUsecase = logoutUsecase;

  final SessionManager _sessionManager = getIt<SessionManager>();
  final BuildContext _context = navigatorKey.currentContext!;

  String? _userFullName;
  String get userFullName => (_userFullName ?? '');

  void init() {
    fetchSecretMessage();
    _fetchUserFullName();
  }

  void _fetchUserFullName() {
    final name = _sessionManager.fetchFullName;
    _userFullName = name;
    notifyListeners();
  }

  String? message;
  void fetchSecretMessage() async {
    _setDashboardState(DashboardState.loading);

    final res = await _fetchSecretMessageUsecase(const NoParams());

    res.fold(
      (l) {
        _setDashboardState(DashboardState.error);
      },
      (r) {
        _setDashboardState(DashboardState.success);

        message = r;
        notifyListeners();
      },
    );
  }

  void logout() async {
    LoadingWidget.show(_context);

    final res = await _logoutUsecase(const NoParams());

    goBack();

    res.fold(
      (l) {
        Toast.showErrorToast(message: l.message);
      },
      (r) {
        _sessionManager.clearStorage();

        clearRoad(SignInView.route);
      },
    );
  }

  DashboardState _state = DashboardState.loading;
  DashboardState get dashboardState => _state;

  void _setDashboardState(DashboardState state) {
    _state = state;
    notifyListeners();
  }
}

enum DashboardState {
  loading,
  error,
  success,
}
