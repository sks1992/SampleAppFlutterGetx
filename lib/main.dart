import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_route.dart';
import 'colors.dart';
import 'core/binding/auth_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      getPages: AppRoute.route,
      initialRoute: RouteNames.splash,
      defaultTransition: Transition.cupertino,
      initialBinding: AuthBinding(),
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatchColor)
            .copyWith(secondary: accentColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: colorWhite,
          foregroundColor: Colors.black54,
          elevation: 0.0,
        ),
        fontFamily: 'Ubuntu',
      ),
    );
  }
}
