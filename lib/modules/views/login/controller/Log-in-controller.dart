import 'dart:developer';

import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:firebase_project/modules/views/login/model/loginmodel.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginModel model = LoginModel(password: false.obs);

  hidePassword() {
    model.password.value = !model.password.value;
  }
}
