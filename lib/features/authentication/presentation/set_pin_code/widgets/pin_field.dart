import 'package:pinput/pinput.dart';
import 'package:smart_pay/core/core.dart';

class PinField extends StatefulWidget {
  const PinField({super.key, required this.controller, this.onChanged});
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  State<PinField> createState() => _PinFieldState();
}

class _PinFieldState extends State<PinField> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Center(
        child: Pinput(
          length: 5,
          readOnly: true,
          obscureText: true,
          obscuringCharacter: '\u25CF',
          useNativeKeyboard: false,
          controller: widget.controller,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme,
          submittedPinTheme: defaultPinTheme,
          onChanged: widget.onChanged,
          errorTextStyle: TextStyle(
            fontSize: sp(kfsTiny),
            color: kRed,
          ),
          validator: (v) {
            if (v?.isEmpty ?? true) {
              return 'Please fill in the fields';
            }
            if (v?.length != 5) {
              return 'Please enter a 5-digit OTP';
            }
            return null;
          },
        ),
      ),
    );
  }

  PinTheme get defaultPinTheme => PinTheme(
        width: w(kfs56),
        height: h(kfs56),
        textStyle: const TextStyle(
          fontSize: kGlobalPadding,
          color: kPrimaryColor,
          fontWeight: w700,
          fontFamily: 'SF Pro Display',
        ),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(color: kText1Color, width: 1.5),
          ),
        ),
      );
}
