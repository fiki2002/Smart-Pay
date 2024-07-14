import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class UserInfoDetailsForm extends StatefulWidget {
  const UserInfoDetailsForm({super.key});

  @override
  State<UserInfoDetailsForm> createState() => _UserInfoDetailsFormState();
}

class _UserInfoDetailsFormState extends State<UserInfoDetailsForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      onChanged: () {
        setState(
          () {
            _isButtonActive = _key.currentState?.validate() ?? false;
          },
        );
      },
      child: Column(
        children: [
          TextFieldWidget(
            hintText: 'Full name',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            onChanged: (v) => context.signUp.updateSignUpData('fullName', v),
            validator: (p0) => p0?.validateFullName(),
          ),
          vSpace(kfsMedium),
          TextFieldWidget(
            hintText: 'Username',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            onChanged: (v) => context.signUp.updateSignUpData('username', v),
            validator: (p0) => p0?.validateUserName(),
          ),
          vSpace(kfsMedium),
          Selector<SignUpNotifier, Country?>(
            selector: (_, viewModel) => viewModel.selectedCountry,
            builder: (__, country, _) {
              return TextFieldWidget(
                hintText: 'Select Country',
                isReadOnly: true,
                prefix: (country != null) ? country.countryFlag.svg() : null,
                suffix: chevronBottom.svg(),
                controller: (country != null)
                    ? TextEditingController(text: country.name)
                    : null,
                onTap: () => SelectCountryBS.show(context),
              );
            },
          ),
          vSpace(kfsMedium),
          TextFieldWidget(
            hintText: 'Password',
            textInputAction: TextInputAction.done,
            isPassword: true,
            onChanged: (v) => context.signUp.updateSignUpData('password', v),
            onFieldSubmitted: (_) => _submit(),
            keyboardType: TextInputType.visiblePassword,
            validator: (p0) => p0?.validatePassword(),
          ),
          vSpace(kGlobalPadding),
          Button(
            active: _isButtonActive,
            onTap: _submit,
            text: 'Continue',
          ),
        ],
      ),
    );
  }

  void _submit() {
    if ((_key.currentState?.validate() ?? false) &&
        context.signUp.selectedCountry != null) {
      context.signUp.register();
    }
  }
}
