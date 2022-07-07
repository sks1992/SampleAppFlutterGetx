import 'package:get/get.dart';
import 'package:sample_app_getx_flutter/ui/view/login_screen.dart';
import 'package:sample_app_getx_flutter/ui/view/register_screen.dart';
import 'package:sample_app_getx_flutter/ui/view/splash_view.dart';

class RouteNames {
  static String splash = "/splash";
  static String login = "/login";
  static String register = "/register";
}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginPageScreen(),
    ),
    GetPage(
      name: RouteNames.register,
      page: () => RegisterPageScreen(),
    ),
  ];
}
