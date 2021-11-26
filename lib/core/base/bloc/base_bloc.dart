import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portofolio/core/util/log.dart';
import 'package:portofolio/core/theme/themes.dart';

import 'event_bloc.dart';
import 'state_bloc.dart';

abstract class BaseBloc<T extends EventBloc, P extends StateBloc>
    extends Bloc<T, P> {
  BaseBloc(P initialState) : super(initialState);

  BuildContext? context;

  /// Print log for debugging with this function
  void setLog(dynamic desc, {String log = "Log ==>"}) {
    Log.setLog(desc, log: log);
  }

  /// Show toast
  void toast(String title) {
    Fluttertoast.showToast(
      msg: title,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Themes.dark.colorScheme.secondary,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  /// Show error toast
  void error(String title) {
    Fluttertoast.showToast(
      msg: title,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Themes.dark.colorScheme.error,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
