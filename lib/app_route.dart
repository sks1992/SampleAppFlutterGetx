import 'package:get/get.dart';
import 'package:sample_app_getx_flutter/ui/view/splash_view.dart';

class RouteNames {
  static String splash = "/splash";

}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashView(),
    ),
  ];
}
