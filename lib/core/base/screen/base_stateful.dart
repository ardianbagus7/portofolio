import 'package:flutter/material.dart';
import 'package:portofolio/core/util/log.dart';

abstract class BaseStateful<S extends StatefulWidget> extends State<S> {
  // /// Access the Navigation Service
  // final NavigationService nav = NavigationService.instance;

  // /// Access app Text Style Theme
  // final TextStyleTheme tTheme = TextStyleTheme.instance;

  // /// Access SVG with this property
  // final SVGDirectory svgDir = SVGDirectory.instance;

  // /// Access messenger service with this property
  // final MessengerService messenger = MessengerService.instance;

  /// Set screen size
  late double height;
  late double width;
  void setSize(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }

  /// Print log for debugging with this function
  void setLog(dynamic desc, {String log = "Log ==>"}) {
    Log.setLog(desc, log: log);
  }

  /// Show snackbar with this function
  void showSnackBar(
    String message, {
    Widget? snackbar,
    String? leadingIcon,
    Widget? leading,
    Widget? trailing,
    String? actionText,
    double? bottomPadding = 100.0,
    void Function()? actionCallback,
  }) {}

  /// Variable contains height of the on-screen keyboard
  double keyboardHeight = 0.0;
  void calculateBottomInsets() {
    keyboardHeight = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance!.window.viewInsets,
      WidgetsBinding.instance!.window.devicePixelRatio,
    ).bottom;
  }

  // Body Constraints
  Widget bodyConstraints({required Widget child, double maxWidth = 1200}) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }

  /// Body of the page
  Widget body();

  @override
  Widget build(BuildContext context) {
    setSize(context);
    calculateBottomInsets();
    // setStatusBarColorToPrimary();
    return body();
  }
}
