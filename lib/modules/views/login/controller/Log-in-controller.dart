import 'dart:developer';

import 'package:firebase_project/modules/views/login/model/loginmodel.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginModel Plogin = LoginModel(password: false);

  void onInit() {
    // called immediately after the widget is allocated memory
    hidePassword();
    super.onInit();
  }

  hidePassword() {
    Plogin.password = !Plogin.password;
    log("${Plogin.password}");
    update();
  }
}
