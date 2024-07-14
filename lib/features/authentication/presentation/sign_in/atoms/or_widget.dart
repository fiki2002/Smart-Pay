import 'package:smart_pay/core/core.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _Divider(),
        hSpace(kfsVeryTiny),
        const TextWidget(
          'OR',
          textColor: kText4Color,
        ),
        hSpace(kfsVeryTiny),
        const _Divider(
          isSecond: true,
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({this.isSecond = false});
  final bool isSecond;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: h(2),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSecond
                ? [kBg1, kBg1.withOpacity(.1)]
                : [kBg1.withOpacity(.1), kBg1],
          ),
        ),
      ),
    );
  }
}
