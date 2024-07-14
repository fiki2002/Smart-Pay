import 'package:smart_pay/core/core.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          title,
          fontWeight: w600,
          fontSize: kGlobalPadding,
        ),
        vSpace(kfs8),
        TextWidget(
          subtitle,
          fontWeight: w400,
          textColor: kText4Color,
          fontSize: kfsMedium,
        ),
      ],
    );
  }
}
