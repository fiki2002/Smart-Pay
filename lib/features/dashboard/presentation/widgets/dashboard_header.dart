import 'package:smart_pay/core/core.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key, required this.userFullName});
  final String userFullName;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichTextWidget(
              text: 'Hello, ',
              fontWeight: w500,
              fontSize: kfsMedium,
              fontWeight2: w600,
              fontSize2: kfsMedium,
              textColor2: kText2Color,
              text2: userFullName,
            ),
            const TextWidget(
              'You are now a smart pay user!',
              fontWeight: w400,
              textColor: kText4Color,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: context.dashboard.logout,
          child: logout.svg(),
        ),
      ],
    );
  }
}
