import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portofolio/core/base/bloc/base_bloc.dart';
import 'package:portofolio/core/base/bloc/event_bloc.dart';
import 'package:portofolio/core/base/bloc/state_bloc.dart';
import 'package:portofolio/core/util/log.dart';

import '../../../injectable.dart';

abstract class StatefulBloc<S extends StatefulWidget, B extends BaseBloc<E, ST>,
    ST extends StateBloc, E extends EventBloc> extends State<S> {
  // NavigationService nav = NavigationService.instance;
  // MessengerService messenger = MessengerService.instance;
  // TextStyleTheme tTheme = TextStyleTheme.instance;
  // SVGDirectory svgDir = SVGDirectory.instance;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // late B bloc;

  double? height;
  double? width;

  bool isLoading = false;

  @override
  void dispose() {
    // bloc.close();
    super.dispose();
  }

  void setSize(BuildContext context) {}

  /// Variable contains height of the on-screen keyboard
  double keyboardHeight = 0.0;
  void calculateBottomInsets() {
    keyboardHeight = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance!.window.viewInsets,
      WidgetsBinding.instance!.window.devicePixelRatio,
    ).bottom;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    calculateBottomInsets();
    // setStatusBarColorToPrimary();
    return body(context);
  }

  Widget createBloc({required Widget child, required E event}) {
    return BlocProvider<B>(
      create: (context) => getIt<B>()..add(event),
      child: child,
    );
  }

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

  void loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) => Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(24.0),
            ),
          ),
          padding: const EdgeInsets.all(30.0),
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  void closeLoading() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Widget blocSelector<V>({
    required BlocWidgetBuilder<V> builder,
    required BlocWidgetSelector<ST, V> d,
  }) {
    return BlocSelector<B, ST, V>(selector: d, builder: builder);
  }

  Widget body(BuildContext context);

  void pushEvent(
    E event,
  ) {
    setLog(event.runtimeType);
    context.read<B>().add(event);
  }

  void initEvent(
    E event,
  ) {
    setLog(event.runtimeType);
    Future.delayed(const Duration(milliseconds: 300), () => pushEvent(event));
  }

  void initVoid(void function) {
    Future.delayed(const Duration(milliseconds: 300), () => function);
  }

  Widget blocConsumer(
      {required BlocWidgetBuilder<ST> builder,
      required void Function(BuildContext, ST) listener}) {
    return BlocConsumer<B, ST>(builder: builder, listener: listener);
  }

  Widget blocBuilder({required BlocWidgetBuilder<ST> builder}) {
    return BlocBuilder<B, ST>(builder: builder);
  }

  Widget blocListener({
    required void Function(BuildContext, ST) listener,
    required Widget child,
  }) {
    return BlocListener<B, ST>(
      listener: listener,
      child: child,
    );

    // BlocBuilder<B, ST>(builder: builder);
  }

  @override
  void initState() {
    super.initState();
    // bloc = context.read<B>();
  }

  void pushState(FrameCallback st) {
    WidgetsBinding.instance!.addPostFrameCallback(st);
  }

  Future<void> closeKeyboard({
    bool condition = true,
  }) async {
    if (condition) {
      return await Future.delayed(
        const Duration(milliseconds: 1),
        () => FocusScope.of(context).unfocus(),
      );
    }
  }

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
    double? bottomPadding,
    void Function()? actionCallback,
  }) {
    // messenger.showSnackBar(
    //   message: message,
    //   leadingIcon: leadingIcon,
    //   leading: leading,
    //   trailing: trailing,
    //   actionText: actionText,
    //   bottomPadding: bottomPadding ?? 100.0.h,
    //   actionCallback: actionCallback,
    // );
  }
}
