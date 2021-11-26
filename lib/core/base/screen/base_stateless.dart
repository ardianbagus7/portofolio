import 'package:flutter/material.dart';
import 'package:portofolio/core/util/log.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
abstract class BaseStateless extends StatelessWidget {
  /// Variable contains height of the on-screen keyboard
  late double keyboardHeight = 0.0;

  // /// Access the Navigation Service
  // final NavigationService nav = NavigationService.instance;

  // /// Access app Text Style Theme
  // final TextStyleTheme tTheme = TextStyleTheme.instance;

  // /// Access SVG with this property
  // final SVGDirectory svgDir = SVGDirectory.instance;

  // /// Access messenger service with this property
  // final MessengerService messenger = MessengerService.instance;

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
  }) {
    // messenger.showSnackBar(
    //   message: message,
    //   leadingIcon: leadingIcon,
    //   leading: leading,
    //   trailing: trailing,
    //   actionText: actionText,
    //   bottomPadding: bottomPadding,
    //   actionCallback: actionCallback,
    // );
  }

  /// Body of the page
  Widget body();

  void calculateBottomInsets() {
    keyboardHeight = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance!.window.viewInsets,
      WidgetsBinding.instance!.window.devicePixelRatio,
    ).bottom;
  }

  @override
  Widget build(BuildContext context) {
    // setStatusBarColorToPrimary();
    calculateBottomInsets();
    return body();
  }
}
