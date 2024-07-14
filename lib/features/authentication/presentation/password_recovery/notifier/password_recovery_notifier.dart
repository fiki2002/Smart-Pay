import 'package:smart_pay/core/core.dart';

class PasswordRecoveryNotifier extends ChangeNotifier {
  String? _email;

  String get email => _email ?? '';

  void updateEmail(String? email) {
    _email = email;
    notifyListeners();
  }
}
