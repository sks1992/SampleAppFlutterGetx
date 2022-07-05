import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx_flutter/core/model/user_response.dart';

import '../../formats.dart';

class LoginScreenController extends GetxController
    with StateMixin<UserResponse> {
  late TextEditingController username;
  late TextEditingController password;

  var showProgress = false.obs;


  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();

    super.onClose();
  }


  Future login() async {
    final userName = username.text;
    final passWord = password.text;

    if (userName.isEmpty) {
      showMessageDialog('User name is required');
      return;
    }
    if (passWord.isEmpty) {
      showMessageDialog('Password is required');
      return;
    }

    showProgress.value = true;
    // var _authTokenResult =
    // await _identityApi.authenticateUser(userName, password);
    //
    // if (!_authTokenResult.isSuccess) {
    //   showMessageDialog(_authTokenResult.message, title: 'Failed');
    // } else {
    //   _sharedService.storeAuthToken(_authTokenResult.authToken);
    //   await _getUserInfo();
    // }
    showProgress.value = false;
  }
}
