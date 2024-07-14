import 'dart:ui';

import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class OnboardingFooter extends StatelessWidget {
  const OnboardingFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .45,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Selector<OnboardingNotifier, int>(
            builder: (context, currentIndex, _) {
              return Container(
                height: screenHeight * .42,
                width: screenWidth,
                decoration: const BoxDecoration(color: kWhiteColor),
                child: Column(
                  children: [
                    verticalGap(screenHeight * .05),
                    TextWidget(
                      switch (currentIndex) {
                        0 => 'Finance app the safest\nand most trusted',
                        1 => 'The fastest transaction\nprocess only here',
                        _ => '',
                      },
                      fontSize: kGlobalPadding,
                      fontWeight: w600,
                      textAlign: TextAlign.center,
                      textColor: kPrimaryColor,
                    ),
                    vSpace(kfsMedium),
                    TextWidget(
                      switch (currentIndex) {
                        0 =>
                          'Your finance work starts here. Our here to help\nyou track'
                              ' and deal with speeding up your\ntransactions.',
                        1 =>
                          'Get easy to pay all your bills with just a few\nsteps. '
                              'Paying your bills become fast and\nefficient.',
                        _ => '',
                      },
                      textAlign: TextAlign.center,
                      textColor: kText4Color,
                    ),
                    vSpace(kfsMedium),
                    DotIndicator(
                      currentIndex: currentIndex,
                    ),
                    vSpace(kfs32),
                    Button(
                      width: screenWidth * .8,
                      onTap: () {
                        context.onboarding.setAuthStatus();
                        goTo(SignInView.route, arguments: true);
                      },
                      text: 'Get Started',
                    ),
                  ],
                ),
              );
            },
            selector: (_, viewModel) => viewModel.index,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 10,
                  tileMode: TileMode.repeated,
                ),
                child: Container(
                  height: screenHeight * .05,
                  decoration: BoxDecoration(
                    color: kWhiteColor.withOpacity(.7),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
