import 'package:carousel_slider/carousel_slider.dart';
import 'package:smart_pay/core/core.dart';

class OnboardingCarousel extends StatelessWidget {
  const OnboardingCarousel({super.key, required this.onboardingImages});
  final List<Image> onboardingImages;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: onboardingImages.length,
      disableGesture: true,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: screenHeight * .6,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: duration5s,
        onPageChanged: (int index, _) => context.onboarding.setIndex(index),
      ),
      itemBuilder: (context, index, realIndex) {
        return SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              onboardingImages[index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: sh(30),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      stops: [0, 1],
                      colors: [Color.fromRGBO(255, 255, 255, 0), kWhiteColor],
                    ),
                  ),
                ),
              ),
              if (index == 0) ...[
                Positioned(
                  bottom: screenHeight * .25,
                  left: 20,
                  child: onboardImage1MinorII.svg(),
                ),
                Positioned(
                  bottom: screenHeight * .29,
                  right: -200,
                  left: 0,
                  child: onboardImage1Minor.svg(),
                ),
                Positioned(
                  top: screenHeight * .05,
                  left: screenWidth * .13,
                  child: onboardImageMinorIII.svg(),
                ),
              ],
              if (index == 1) ...[
                Positioned(
                  top: screenHeight * .14,
                  left: screenWidth * .1,
                  child: onboardImage2Minor.svg(),
                ),
                Positioned(
                  right: screenWidth * .1,
                  child: const _Contact(),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: w(kfsTiny),
        vertical: h(kfsLarge),
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(sr(kfsVeryTiny)),
        boxShadow: const [
          BoxShadow(
            color: kShadow1,
            offset: Offset(-15, 15),
            blurRadius: 25,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage(onboardImage2MinorII),
          ),
          vSpace(kMinute),
          const TextWidget(
            'Andrade\nAlexander Base',
            fontWeight: w600,
            textAlign: TextAlign.center,
            fontSize: kfs8,
            textColor: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
