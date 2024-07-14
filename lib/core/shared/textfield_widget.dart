import 'package:smart_pay/core/core.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType,
    this.onChanged,
    this.suffix,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.isReadOnly = false,
    this.onTap,
    this.prefix,
    this.controller,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final bool isPassword;
  final void Function(String?)? onChanged;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool isReadOnly;
  final VoidCallback? onTap;
  final Widget? prefix;
  final TextEditingController? controller;

  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureText,
      builder: (context, bool value, _) {
        return TextFormField(
          cursorColor: kPrimaryColor,
          obscuringCharacter: '\u25CF',
          keyboardType: keyboardType,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          textInputAction: textInputAction,
          validator: validator,
          onTap: onTap,
          readOnly: isReadOnly,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: value && isPassword,
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: w600,
            fontSize: sp(kfsMedium),
            color: kPrimaryColor,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: kBg2,
            prefixIcon: prefix,
            hintStyle: TextStyle(
              fontSize: sp(kfsMedium),
              color: kText5Color,
              fontWeight: w400,
              fontFamily: 'SF Pro Display',
            ),
            suffixIcon: isPassword == true
                ? suffixWidget(value)
                : suffix ?? const SizedBox(),
            border: _border,
            enabledBorder: _border,
            focusedBorder: _border,
          ),
        );
      },
    );
  }

  OutlineInputBorder get _border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(sr(kfsMedium)),
      borderSide: const BorderSide(color: kBg2),
    );
  }

  Widget suffixWidget(bool value) {
    return GestureDetector(
      onTap: () => obscureText.value = !obscureText.value,
      child: switch (value) {
        true => eyeOpen.svg(),
        false => eyeClosed.svg(),
      },
    );
  }
}
