import 'package:get/get.dart';
import 'package:portofolio/core/shared_widget/404_not_found_screen.dart';
import 'package:portofolio/features/auth/presentation/pages/splash_screen.dart';
import 'package:portofolio/features/portofolio/presentation/pages/portofolio_page.dart';

class Routes {
  List<GetPage> getPages({String? id}) {
    final _list = [
      GetPage(
        name: "${PortofolioPage.tag}/:user",
        page: () => const PortofolioPage(),
      ),
      GetPage(
        name: SplashScreen.tag,
        page: () => const SplashScreen(),
      ),
    ];
    return _list;
  }

  static GetPage unknownRoute = GetPage(
    name: "/not-found",
    page: () => const NotFoundPage(),
  );
}
