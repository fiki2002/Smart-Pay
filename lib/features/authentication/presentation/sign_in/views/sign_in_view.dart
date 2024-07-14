import 'package:flutter/gestures.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key, this.canPop = true});
  final bool? canPop;

  static const String route = '/sign_in_view';
  @override
  Widget build(BuildContext context) {
    print(canPop);
    return ScaffoldWidget(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (canPop == true) ...[
            vSpace(kSize5),
            const BackWidget(),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace(kfs32),
                const AuthHeader(
                  title: 'Hi There! 👋',
                  subtitle: 'Welcome back, Sign in to your account',
                ),
                vSpace(kfs32),
                const SignInForm(),
                vSpace(kfs32),
                const SignInOptions(),
              ],
            ),
          ),
          Center(
            child: RichTextWidget(
              text: 'Don\'t have an account? ',
              text2: 'Sign Up',
              onTap: TapGestureRecognizer()
                ..onTap = () => goTo(SignUpView.route),
              textColor: kText4Color,
              fontWeight: w400,
              fontSize: kfsMedium,
              fontWeight2: w600,
              fontSize2: kfsMedium,
              textColor2: kText1Color,
            ),
          ),
          vSpace(kGlobalPadding),
        ],
      ),
      useSingleScroll: false,
    );
  }
}
