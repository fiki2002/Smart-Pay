import 'package:flutter/gestures.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const String route = '/sign_up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool _isButtonActive = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpace(kSize5),
          const BackWidget(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace(kfs32),
                const RichTextWidget(
                  text: 'Create a ',
                  text2: 'Smartpay\n',
                  text3: ' account',
                  fontWeight: w600,
                  fontWeight2: w600,
                  textColor2: kText1Color,
                  textColor: kPrimaryColor,
                  fontSize: kGlobalPadding,
                  fontSize2: kGlobalPadding,
                ),
                vSpace(kfs32),
                Form(
                  key: _key,
                  onChanged: () {
                    setState(
                      () {
                        _isButtonActive =
                            _key.currentState?.validate() ?? false;
                      },
                    );
                  },
                  child: TextFieldWidget(
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    onChanged: context.signUp.updateEmail,
                    validator: (p0) => p0?.validateEmail(),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _submit(),
                  ),
                ),
                vSpace(kGlobalPadding),
                Button(
                  onTap: _submit,
                  active: _isButtonActive,
                  text: 'Sign Up',
                ),
                vSpace(kfs32),
                const SignInOptions(),
              ],
            ),
          ),
          Center(
            child: RichTextWidget(
              text: 'Already have an account? ',
              text2: 'Sign In',
              onTap: TapGestureRecognizer()
                ..onTap = () => goTo(SignInView.route),
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

  void _submit() {
    FocusManager.instance.primaryFocus?.unfocus();

    if (_key.currentState?.validate() ?? false) {
      context.signUp.getEmailToken();
    }
  }
}
