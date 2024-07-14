import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class EnterPinView extends StatefulWidget {
  const EnterPinView({super.key});
  static const String route = '/enter_pin_view';

  @override
  State<EnterPinView> createState() => _EnterPinViewState();
}

class _EnterPinViewState extends State<EnterPinView> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Consumer<SetPinCodeNotifier>(
        builder: (context, viewModel, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSpace(kfs32),
              const AuthHeader(
                title: 'Welcome back, ',
                subtitle: 'Enter pin to continue',
              ),
              verticalGap(screenHeight * .1),
              PinField(
                controller: _controller,
                onChanged: context.setPin.updateInputtedPin,
              ),
              verticalGap(screenHeight * .1),
              Button(
                onTap: context.setPin.verifyPin,
                text: 'Verify Pin',
                active: _controller.text.length == 5,
              ),
              vSpace(kGlobalPadding),
            ],
          );
        },
      ),
      bottomNavigationBar: KeyPad(controller: _controller),
      useSingleScroll: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
