import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  static const String route = '/create-new-password';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpace(kSize5),
          const BackWidget(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace(kfs32),
                const AuthHeader(
                  title: 'Create New Password',
                  subtitle: 'Please, enter a new password below different from'
                      ' the previous password',
                ),
                vSpace(kfs32),
                TextFieldWidget(
                  hintText: 'Password',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  validator: (p0) => p0?.validatePassword(),
                ),
                vSpace(kfsMedium),
                TextFieldWidget(
                  hintText: 'Confirm Password',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: (p0) => p0?.validatePassword(),
                ),
              ],
            ),
          ),
          Button(
            onTap: () {
              goBack();
              goBack();
              goBack();
            },
            text: 'Create new password',
          ),
          vSpace(kGlobalPadding),
        ],
      ),
      useSingleScroll: false,
    );
  }
}
