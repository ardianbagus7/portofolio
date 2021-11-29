import 'package:flutter/material.dart';
import 'package:portofolio/core/base/screen/base_stateless.dart';

class NotFoundPage extends BaseStateless {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("404 Not Found"),
      ),
    );
  }
}
