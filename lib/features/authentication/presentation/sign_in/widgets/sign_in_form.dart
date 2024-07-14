import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFieldWidget(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (p0) => p0?.validateEmail(),
            onChanged: (p0) => context.signIn.updateSignInData(
              'email',
              p0,
            ),
            textInputAction: TextInputAction.next,
          ),
          vSpace(kfsMedium),
          TextFieldWidget(
            hintText: 'Password',
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            onChanged: (p0) => context.signIn.updateSignInData(
              'password',
              p0,
            ),
            validator: (p0) => p0?.validatePassword(),
            onFieldSubmitted: (p0) => _submit(),
          ),
          vSpace(kfsLarge),
          TextWidget(
            'Forgot Password?',
            onTap: () => goTo(PasswordRecoveryView.route),
            fontWeight: w600,
            textColor: kText1Color,
            fontSize: kfsMedium,
          ),
          vSpace(kGlobalPadding),
          Button(
            onTap: _submit,
            text: 'Sign In',
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (_key.currentState?.validate() ?? false) {
      context.signIn.login();
    }
  }
}
