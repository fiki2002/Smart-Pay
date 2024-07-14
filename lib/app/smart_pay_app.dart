import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/core/core.dart';

class SmartPayApp extends StatelessWidget {
  const SmartPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, Widget? child) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            title: 'Smart Pay',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: navigatorKey,
          ),
        );
      },
    );
  }
}
