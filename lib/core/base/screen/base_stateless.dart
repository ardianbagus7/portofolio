import 'package:flutter/material.dart';
import 'package:portofolio/core/util/log.dart';

abstract class BaseStateless extends StatelessWidget {
  const BaseStateless({Key? key}) : super(key: key);

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
  Widget body(BuildContext context);

  void calculateBottomInsets() {}

  @override
  Widget build(BuildContext context) {
    // setStatusBarColorToPrimary();
    return body(context);
  }
}
