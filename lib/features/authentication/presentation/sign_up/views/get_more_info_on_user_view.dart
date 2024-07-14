import 'package:smart_pay/core/core.dart';
import 'package:smart_pay/features/features.dart';

class GetMoreInfoOnUserView extends StatelessWidget {
  const GetMoreInfoOnUserView({super.key});

  static const String route = '/get_more_info_on_user_view';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpace(kSize5),
          const BackWidget(),
          vSpace(kfs32),
          const RichTextWidget(
            text: 'Hey there! tell us a bit\nabout ',
            text2: 'yourself',
            fontWeight: w700,
            fontWeight2: w700,
            textColor2: kText1Color,
            textColor: kPrimaryColor,
            fontSize: kGlobalPadding,
            fontSize2: kGlobalPadding,
          ),
          vSpace(kfs32),
          const UserInfoDetailsForm(),
        ],
      ),
      useSingleScroll: true,
    );
  }
}
