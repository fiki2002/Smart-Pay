import 'package:smart_pay/core/core.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 2; i++)
          _IndicatorTile(
            isActive: currentIndex == i,
          ),
      ],
    );
  }
}

class _IndicatorTile extends StatelessWidget {
  const _IndicatorTile({required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration500ms,
      margin: EdgeInsets.only(right: w(4)),
      curve: Curves.fastEaseInToSlowEaseOut,
      constraints: BoxConstraints(
        maxWidth: w(isActive ? kGlobalPadding : kSize5),
        maxHeight: h(kSize5),
      ),
      decoration: BoxDecoration(
        color: isActive ? kPrimaryColor : kBg1,
        borderRadius: BorderRadius.circular(sr(isActive ? kMinute : kfs100)),
      ),
    );
  }
}
