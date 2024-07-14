import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  static const String route = '/onboarding_view';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late List<Image> onboardingImages;

  @override
  void initState() {
    super.initState();
    onboardingImages = [
      Image.asset(onboardImage1),
      Image.asset(onboardImage2),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (var image in onboardingImages) {
      precacheImage(image.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Stack(
        children: [
          Column(
            children: [
              vSpace(kGlobalPadding),
              const Align(
                alignment: Alignment.topRight,
                child: TextWidget(
                  'Skip',
                  fontWeight: w600,
                  fontSize: kfsMedium,
                  textColor: kText2Color,
                ),
              ),
              verticalGap(screenHeight * .06),
              OnboardingCarousel(
                onboardingImages: onboardingImages,
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: OnboardingFooter(),
          ),
        ],
      ),
      useSingleScroll: false,
    );
  }
}
