import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/authentication/authentication.dart';

class PasswordRecoveryChoiceContainer extends StatelessWidget {
  const PasswordRecoveryChoiceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: w(kfsMedium),
        vertical: h(kfsExtraLarge),
      ),
      decoration: BoxDecoration(
        color: kBg2,
        borderRadius: BorderRadius.circular(sr(kfsMedium)),
      ),
      child: Row(
        children: [
          check.svg(),
          hSpace(kfsLarge),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  'Email',
                  fontWeight: w600,
                  fontSize: kfsMedium,
                  textColor: kPrimaryColor,
                ),
                vSpace(kSize5),
                Selector<PasswordRecoveryNotifier, String>(
                  selector: (_, viewModel) => viewModel.email,
                  builder: (_, email, __) {
                    return TextWidget(
                      email.maskEmail,
                      fontSize: kfsVeryTiny,
                      fontWeight: w500,
                      textColor: kText4Color,
                    );
                  },
                ),
              ],
            ),
          ),
          mail.svg(),
        ],
      ),
    );
  }
}
