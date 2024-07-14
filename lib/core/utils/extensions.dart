import 'package:flutter_svg/svg.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

extension NotifierExtension on BuildContext {
  OnboardingNotifier get onboarding =>
      Provider.of<OnboardingNotifier>(this, listen: false);

  SignInNotifier get signIn => Provider.of<SignInNotifier>(this, listen: false);

  DashboardNotifier get dashboard =>
      Provider.of<DashboardNotifier>(this, listen: false);

  PasswordRecoveryNotifier get passwordRecovery =>
      Provider.of<PasswordRecoveryNotifier>(this, listen: false);

  SignUpNotifier get signUp => Provider.of<SignUpNotifier>(this, listen: false);
  SetPinCodeNotifier get setPin =>
      Provider.of<SetPinCodeNotifier>(this, listen: false);
}

extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      List<String> words = split(' ');
      if (words.length > 1) {
        for (int i = 0; i < words.length; i++) {
          if (words[i].isNotEmpty) {
            words[i] =
                words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
          }
        }
        return words.join(' ');
      }

      return words[0].toUpperCase() + words[0].substring(1).toLowerCase();
    }
    return '';
  }

  String firstWord() {
    if (trim().isEmpty) {
      return '';
    }

    final RegExp wordRegExp = RegExp(r'\b\w+\b');
    final match = wordRegExp.firstMatch(this);

    if (match != null) {
      return match.group(0) ?? '';
    } else {
      return '';
    }
  }

  String get maskEmail {
    if (isEmpty) {
      return this;
    }

    List<String> parts = split('@');
    if (parts.length != 2) {
      return this;
    }

    String localPart = parts[0];
    String domainPart = parts[1];

    int middlePartLength = (localPart.length / 2).floor();

    String maskedLocalPart = localPart.substring(0, localPart.length ~/ 2) +
        '*' * middlePartLength +
        localPart.substring(localPart.length ~/ 2 + middlePartLength);

    String maskedEmail = '$maskedLocalPart@$domainPart';

    return maskedEmail;
  }
}

extension SvgExtension on String {
  SvgPicture svg([Color? color]) => SvgPicture.asset(
        this,
        fit: BoxFit.scaleDown,
        // ignore: deprecated_member_use
        color: color,
      );
}

extension ValidatingExtensions on String {
  String? validateAnyField({String? field}) {
    if (toString().isEmpty) {
      return '$field field is required ';
    } else {
      return null;
    }
  }

  String? validatePhoneNumber() {
    if (isEmpty) {
      return 'Phone number is required';
    }

    final pattern = RegExp(r'^\+?[0-9]{8,}$');

    if (pattern.hasMatch(this)) {
      return null;
    } else {
      return 'Invalid phone number';
    }
  }

  String? validateFullName() {
    if (toString().isEmpty) {
      return 'Full Name is required';
    }

    final RegExp pattern =
        RegExp(r'^[a-zA-Z]+(?:\.[a-zA-Z]+)* [a-zA-Z]+(?:\.[a-zA-Z]+)*$');

    if (pattern.hasMatch(this)) {
      return null;
    } else {
      return 'Full Name should contain at least 2 words';
    }
  }

  String? validateEmail() {
    if (toString().isEmpty) {
      return 'Email is required';
    }

    final pattern = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (pattern.hasMatch(this)) {
      return null;
    } else {
      return 'Invalid email';
    }
  }

  String? validateUserName() {
    if (toString().isEmpty) {
      return 'UserName is required';
    }

    final wordRegExp = RegExp(r'^[a-zA-Z]+$');
    if (wordRegExp.hasMatch(this)) {
      return null;
    } else {
      return 'Username should contain a word';
    }
  }

  String? validatePassword() {
    if (isEmpty) {
      return 'Password is required';
    }

    if (length < 6) {
      return 'Password requires at least 6 characters';
    }

    if (!RegExp(r'\d').hasMatch(this)) {
      return 'Password requires at least a number';
    }
    return null;
  }
}
