import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/core/core.dart';

class Setup {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    await ScreenUtil.ensureScreenSize();

    await SetUpLocators.init();

    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
}
