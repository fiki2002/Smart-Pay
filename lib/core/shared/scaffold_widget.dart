import 'package:smart_pay/core/core.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    required this.body,
    this.appBar,
    this.usePadding = true,
    required this.useSingleScroll,
    this.bg = kWhiteColor,
    this.scaffoldKey,
    this.controller,
    this.scrollPhysics,
    this.safeAreaTop,
    this.extendBody,
    this.statusBarColor,
    this.navBarColor,
    this.isLight = false,
    this.resizeToAvoidBottomInset,
  });

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool usePadding;
  final bool useSingleScroll;
  final Color? bg;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ScrollController? controller;
  final ScrollPhysics? scrollPhysics;
  final bool? safeAreaTop;
  final bool? extendBody;
  final Color? statusBarColor;
  final Color? navBarColor;
  final bool? isLight;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      key: scaffoldKey,
      appBar: appBar,
      extendBody: extendBody ?? true,
      backgroundColor: bg,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: SafeArea(
        top: safeAreaTop ?? true,
        bottom: false,
        child: useSingleScroll
            ? SingleChildScrollView(
                controller: controller,
                physics: scrollPhysics,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    usePadding ? w(kGlobalPadding) : 0,
                    usePadding ? h(kfs8) : 0,
                    usePadding ? w(kGlobalPadding) : 0,
                    0,
                  ),
                  child: body,
                ),
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: usePadding ? w(kGlobalPadding) : 0,
                ),
                child: body,
              ),
      ),
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
