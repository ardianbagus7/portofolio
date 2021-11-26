import 'package:get/get.dart';
import 'package:portofolio/features/auth/presentation/pages/splash_screen.dart';

class Routes {
  List<GetPage> getPages({String? id}) {
    final _list = [
      GetPage(
        name: SplashScreen.tag,
        page: () => const SplashScreen(),
      ),
    ];
    return _list;
  }
}
