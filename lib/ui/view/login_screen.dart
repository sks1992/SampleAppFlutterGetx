import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controller/login_screen_controller.dart';
import '../../formats.dart';
import '../widgets/circle_progress_indicator.dart';
import '../widgets/text_field_new.dart';

class LoginPageScreen extends StatelessWidget {
  LoginPageScreen({Key? key}) : super(key: key);

  final LoginScreenController loginController =
      Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/main_background.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldNew(
                  textEditingController: loginController.email,
                  assetName: "assets/images/email_icon.png",
                  hintText: 'Email',
                  obscureText: true,
                ),
                TextFieldNew(
                  textEditingController: loginController.password,
                  assetName: "assets/images/icon_pin.png",
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => loginController.showProgress.value
                      ? const CircleProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            hideKeyboard();
                            loginController.login();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF0758b4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                right: 45, left: 45, top: 15, bottom: 15),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
