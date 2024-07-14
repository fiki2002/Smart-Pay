import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/authentication/authentication.dart';

class VerifyYourIdentityView extends StatelessWidget {
  const VerifyYourIdentityView({super.key});
  static const String route = '/verify-your-identity';
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace(kfs32),
                verifyIdentity.svg(),
                vSpace(kGlobalPadding),
                const TextWidget(
                  'Verify your identity',
                  fontWeight: w600,
                  fontSize: kGlobalPadding,
                ),
                vSpace(kfs8),
                const RichTextWidget(
                  text: 'Where would you like ',
                  text2: 'Smartpay',
                  text3: ' to send your security code?',
                  fontWeight: w400,
                  fontWeight2: w600,
                  textColor2: kText1Color,
                  textColor: kText4Color,
                  fontSize: kfsMedium,
                  fontSize2: kfsMedium,
                ),
                vSpace(kfs32),
                const PasswordRecoveryChoiceContainer(),
              ],
            ),
          ),
          Button(
            onTap: () => goTo(CreateNewPasswordView.route),
            text: 'Continue',
          ),
          vSpace(kGlobalPadding)
        ],
      ),
      useSingleScroll: false,
    );
  }
}
