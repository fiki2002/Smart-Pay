import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrWidget(),
        vSpace(kGlobalPadding),
        Row(
          children: [
            const OtherAuthOptionsButton(
              authOptionIcon: google,
            ),
            hSpace(kfsMedium),
            const OtherAuthOptionsButton(
              authOptionIcon: apple,
            ),
          ],
        )
      ],
    );
  }
}
