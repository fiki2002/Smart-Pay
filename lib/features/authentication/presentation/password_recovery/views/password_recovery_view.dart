import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class PasswordRecoveryView extends StatefulWidget {
  const PasswordRecoveryView({super.key});

  static const String route = '/password_recovery';

  @override
  State<PasswordRecoveryView> createState() => _PasswordRecoveryViewState();
}

class _PasswordRecoveryViewState extends State<PasswordRecoveryView> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace(kfs32),
                passwordRecovery.svg(),
                vSpace(kGlobalPadding),
                const AuthHeader(
                  title: 'Password Recovery',
                  subtitle:
                      'Enter your registered email below to receive password '
                      'instructions',
                ),
                vSpace(kfs32),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _key,
                  child: TextFieldWidget(
                    hintText: 'Email',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (_) => _submit(),
                    onChanged: context.passwordRecovery.updateEmail,
                    validator: (v) => v?.validateEmail(),
                  ),
                ),
              ],
            ),
          ),
          Button(
            onTap: _submit,
            text: 'Send me email',
          ),
          vSpace(kGlobalPadding),
        ],
      ),
      useSingleScroll: false,
    );
  }

  void _submit() {
    if (_key.currentState?.validate() ?? false) {
      goTo(VerifyYourIdentityView.route);
    }
  }
}
