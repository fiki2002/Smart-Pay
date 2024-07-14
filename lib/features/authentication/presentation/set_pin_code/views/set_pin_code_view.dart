import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SetPinCodeView extends StatefulWidget {
  const SetPinCodeView({super.key, this.canPop = true});

  static const String route = '/set-pin-code';
  final bool? canPop;

  @override
  State<SetPinCodeView> createState() => _SetPinCodeViewState();
}

class _SetPinCodeViewState extends State<SetPinCodeView> {
  late TextEditingController _controller;
  bool isButtonActive = false;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(_onPinChanged);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.canPop == true) ...[
            vSpace(kSize5),
            const BackWidget(),
          ],
          vSpace(kfs32),
          const AuthHeader(
            title: 'Set your PIN code',
            subtitle:
                'We use state-of-the-art security measures to protect your information at all times',
          ),
          vSpace(kfs32),
          PinField(
            controller: _controller,
            onChanged: context.setPin.updatePin,
          ),
          verticalGap(screenHeight * .1),
          Button(
            onTap: context.setPin.setPin,
            text: 'Create Pin',
            active: isButtonActive,
          ),
          vSpace(kGlobalPadding),
        ],
      ),
      bottomNavigationBar: KeyPad(controller: _controller),
      useSingleScroll: false,
    );
  }

  void _onPinChanged() {
    setState(() {
      isButtonActive = _controller.text.length == 5;
    });
  }
}
