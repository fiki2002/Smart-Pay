import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return pageRoute(const SplashView());

      case OnboardingView.route:
        return pageRoute(const OnboardingView());

      case SignInView.route:
        return pageRoute(const SignInView());

      case DashboardView.route:
        return pageRoute(const DashboardView());

      case PasswordRecoveryView.route:
        return pageRoute(const PasswordRecoveryView());

      case VerifyYourIdentityView.route:
        return pageRoute(const VerifyYourIdentityView());

      case CreateNewPasswordView.route:
        return pageRoute(const CreateNewPasswordView());

      case SignUpView.route:
        return pageRoute(const SignUpView());

      case VerifyItsYouView.route:
        return pageRoute(const VerifyItsYouView());

      case GetMoreInfoOnUserView.route:
        return pageRoute(const GetMoreInfoOnUserView());

      case SetPinCodeView.route:
        return pageRoute(const SetPinCodeView());

      case PinSetSuccessView.route:
        return pageRoute(const PinSetSuccessView());

      case EnterPinView.route:
        return pageRoute(const EnterPinView());

      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
