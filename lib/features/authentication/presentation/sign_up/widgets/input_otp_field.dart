import 'package:pinput/pinput.dart';
import 'package:smart_pay/core/core.dart';

class InputOTPField extends StatefulWidget {
  const InputOTPField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<InputOTPField> createState() => _InputOTPFieldState();
}

class _InputOTPFieldState extends State<InputOTPField> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Center(
        child: Pinput(
          length: 5,
          readOnly: true,
          useNativeKeyboard: false,
          controller: widget.controller,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme,
          submittedPinTheme: defaultPinTheme,
          onChanged: context.signUp.updateToken,
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
        decoration: BoxDecoration(
          color: kBg2,
          border: Border.all(color: kBg2),
          borderRadius: BorderRadius.circular(
            sr(kfsVeryTiny),
          ),
        ),
      );
}
