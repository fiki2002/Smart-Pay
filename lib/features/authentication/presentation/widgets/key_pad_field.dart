import 'package:smart_pay/core/core.dart';

class KeyPad extends StatelessWidget {
  const KeyPad({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _keyButton(input: '1'),
            _keyButton(input: '2'),
            _keyButton(input: '3'),
          ],
        ),
        vSpace(kfs8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _keyButton(input: '4'),
            _keyButton(input: '5'),
            _keyButton(input: '6'),
          ],
        ),
        vSpace(kfs8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _keyButton(input: '7'),
            _keyButton(input: '8'),
            _keyButton(input: '9'),
          ],
        ),
        vSpace(kfs8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _keyButton(input: '*'),
            _keyButton(input: '0'),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (controller.text.isNotEmpty) {
                  controller.text =
                      controller.text.substring(0, controller.text.length - 1);
                }
                if (controller.text.length > 5) {
                  controller.text = controller.text.substring(0, 3);
                }
              },
              child: Container(
                width: screenWidth / 4,
                padding: EdgeInsets.symmetric(vertical: h(kfsVeryTiny)),
                child: delete.svg(),
              ),
            ),
          ],
        ),
        verticalGap(screenHeight * .05)
      ],
    );
  }

  Widget _keyButton({required String input}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (controller.text.length <= 4) {
          controller.text = controller.text + input;
        }
      },
      child: Container(
        width: screenWidth / 4,
        padding: EdgeInsets.symmetric(vertical: h(kfsVeryTiny)),
        child: Center(
          child: TextWidget(
            input,
            fontWeight: w500,
            fontSize: kGlobalPadding,
            textColor: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
