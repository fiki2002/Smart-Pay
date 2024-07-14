import 'package:smart_pay/core/core.dart';

class OtherAuthOptionsButton extends StatelessWidget {
  const OtherAuthOptionsButton({super.key, required this.authOptionIcon});
  final String authOptionIcon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: h(kfsMedium)),
        decoration: BoxDecoration(
          border: Border.all(
            color: kBg1,
          ),
          borderRadius: BorderRadius.circular(sr(kfsMedium)),
        ),
        child: authOptionIcon.svg(),
      ),
    );
  }
}
