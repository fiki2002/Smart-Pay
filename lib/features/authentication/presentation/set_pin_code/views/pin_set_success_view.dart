import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class PinSetSuccessView extends StatelessWidget {
  const PinSetSuccessView({super.key});

  static const String route = '/pin_set_success_view';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            congratulations,
            height: h(kfs130),
          ),
          vSpace(kfs32),
          Selector<SetPinCodeNotifier, String>(
            selector: (_, viewModel) => viewModel.userName,
            builder: (context, name, _) {
              return TextWidget(
                'Congratulations, $name',
                fontWeight: w700,
                fontSize: kGlobalPadding,
              );
            },
          ),
          vSpace(kfsMedium),
          const TextWidget(
            'You’ve completed the onboarding,\nyou can start using',
            textAlign: TextAlign.center,
            textColor: kText4Color,
            fontSize: kfsMedium,
          ),
          vSpace(kfs32),
          Button(
            onTap: () => clearRoad(DashboardView.route),
            text: 'Get Started',
          )
        ],
      ),
      useSingleScroll: false,
    );
  }
}
