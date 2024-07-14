import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smart_pay/core/core.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});
  static Future<void> show(BuildContext context) {
    return showAdaptiveDialog(
      context: context,
      barrierColor: Colors.grey.withOpacity(.2),
      barrierDismissible: false,
      builder: (context) => const LoadingWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Center(
        child: LoadingAnimationWidget.threeRotatingDots(
          color: kText2Color,
          size: sp(kfs70),
        ),
      ),
    );
  }
}
