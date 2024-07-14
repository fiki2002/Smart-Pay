import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class VerifyItsYouView extends StatefulWidget {
  const VerifyItsYouView({super.key});

  static const String route = '/verify-its-you';

  @override
  State<VerifyItsYouView> createState() => _VerifyItsYouViewState();
}

class _VerifyItsYouViewState extends State<VerifyItsYouView> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      usePadding: false,
      body: Consumer<SignUpNotifier>(
        builder: (_, viewModel, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w(kGlobalPadding)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSpace(kSize5),
                    const BackWidget(),
                    vSpace(kfs32),
                    const TextWidget(
                      'Verify it\'s you',
                      fontWeight: w600,
                      fontSize: kGlobalPadding,
                    ),
                    vSpace(kfs8),
                    RichTextWidget(
                      text: 'We send a code to ( ',
                      text2: viewModel.email.maskEmail,
                      text3: ' ). Enter it here to verify your identity',
                      fontWeight: w400,
                      fontWeight2: w500,
                      textColor2: kPrimaryColor,
                      textColor: kText4Color,
                      fontSize: kfsMedium,
                      fontSize2: kfsMedium,
                    ),
                    vSpace(kfs32),
                    InputOTPField(controller: _controller),
                    vSpace(kfs32),
                    Center(
                      child: TextWidget(
                        'Resend Code',
                        fontWeight: w700,
                        onTap: () => context.signUp.getEmailToken(
                          shouldNavigate: false,
                        ),
                        fontSize: kfsMedium,
                        textColor: kText6Color,
                      ),
                    ),
                    vSpace(kfs70),
                    Button(
                      active: _controller.text.length == 5,
                      onTap: context.signUp.verifyEmailToken,
                      text: 'Confirm',
                    ),
                  ],
                ),
              ),
              vSpace(kfs32),
            ],
          );
        },
      ),
      bottomNavigationBar: KeyPad(controller: _controller),
      useSingleScroll: false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
