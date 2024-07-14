import 'package:provider/single_child_widget.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

List<SingleChildWidget> _providers = [
  ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
  ChangeNotifierProvider(create: (_) => getIt<SignInNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<SignUpNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<DashboardNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<PasswordRecoveryNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<PasswordRecoveryNotifier>()),
  ChangeNotifierProvider(create: (_) => getIt<SetPinCodeNotifier>()),
];

List<SingleChildWidget> get providers => _providers;
