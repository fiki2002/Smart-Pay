import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String route = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _textOpacityAnimation;
  final SessionManager _sessionManager = getIt<SessionManager>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _initLogoScaleAndFadeIn();
    _initTextFadeIn();
    _controller.forward().then(
      (_) {
        _getPage(_sessionManager.userAuthStatus);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: smartPayLogo.svg(),
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _textOpacityAnimation.value,
                  child: const RichTextWidget(
                    text: 'Smart',
                    text2: 'pay',
                    text3: '.',
                    fontSize: kfs32,
                    fontSize2: kfs32,
                    textColor2: kText1Color,
                    textColor: kPrimaryColor,
                    textColor3: kText1Color,
                    fontWeight: w700,
                    fontWeight2: w700,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      useSingleScroll: false,
    );
  }

  /// This initializes the logo animation such that it scales and fades in
  void _initLogoScaleAndFadeIn() {
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  /// This initializes the text animation so it fades in after the interval of
  /// [_initLogoScaleAndFadeIn]
  void _initTextFadeIn() {
    _textOpacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1, curve: Curves.easeIn),
      ),
    );
  }

  void _getPage(UserAuthStatus? status) {
    AppLogger.log('Current user auth status: $status');
    switch (status) {
      case UserAuthStatus.loggedInWithPin:
      case UserAuthStatus.loggedIn:
        clearRoad(EnterPinView.route);
      case UserAuthStatus.loggedInNoPin:
        clearRoad(SetPinCodeView.route);
      case UserAuthStatus.onboard:
        clearRoad(SignInView.route);
      default:
        clearRoad(OnboardingView.route);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
