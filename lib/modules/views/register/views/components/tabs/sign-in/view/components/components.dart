// userNameValidator(value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter something';
//   }
//   return null;
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/Sign-in-controller.dart';

SignInController loginController = Get.put(SignInController());
// final _loginFormFieldKey = GlobalKey<FormFieldState>();

TextStyle loginTextStyle = const TextStyle(color: Colors.white);

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
var seePassword = loginController.model.password;
