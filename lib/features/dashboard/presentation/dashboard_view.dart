import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  static const String route = '/dashboard_view';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.dashboard.init(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Consumer<DashboardNotifier>(
        builder: (_, viewModel, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeader(
                userFullName: viewModel.userFullName,
              ),
              verticalGap(screenHeight * .1),
              Lottie.asset(welcomeLottie),
              vSpace(kfsMedium),
              switch (viewModel.dashboardState) {
                DashboardState.error => Column(
                    children: [
                      const TextWidget(
                        'We actually do have a message for you, but something went wrong',
                        textAlign: TextAlign.center,
                        textColor: kText4Color,
                      ),
                      vSpace(kfsMedium),
                      Button.withBorderLine(
                        text: 'Try again',
                        width: screenWidth * .5,
                        onTap: context.dashboard.fetchSecretMessage,
                      )
                    ],
                  ),
                DashboardState.loading =>
                  const Center(child: CupertinoActivityIndicator()),
                DashboardState.success => TextWidget(
                    viewModel.message ?? '',
                    textColor: kText4Color,
                    textAlign: TextAlign.center,
                  ),
              },
            ],
          );
        },
      ),
      useSingleScroll: true,
    );
  }
}
