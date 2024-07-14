import 'package:smart_pay/core/core.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goBack,
      child: Container(
        padding: const EdgeInsets.all(kfs8),
        decoration: BoxDecoration(
          border: Border.all(color: kBg1),
          borderRadius: BorderRadius.circular(sr(kfsVeryTiny)),
        ),
        child: chevronLeft.svg(),
      ),
    );
  }
}
