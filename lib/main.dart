import 'package:smart_pay/core/core.dart';

void main() async {
  await Setup.run();

  runApp(const SmartPayApp());
}
