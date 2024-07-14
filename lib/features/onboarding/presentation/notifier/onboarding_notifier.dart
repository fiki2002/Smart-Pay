import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class OnboardingNotifier extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  final SessionManager _sessionManager = getIt<SessionManager>();

  /// This sets the index of the current page from the carousel
  /// on the [OnboardingCarousel]
  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  void setAuthStatus() async {
    await _sessionManager.setUserAuthStatus(UserAuthStatus.onboard);
  }
}
