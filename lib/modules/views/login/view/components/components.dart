import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/Log-in-controller.dart';

// userNameValidator(value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter something';
//   }
//   return null;
// }

LoginController loginController = Get.put(LoginController());
// final _loginFormFieldKey = GlobalKey<FormFieldState>();

TextStyle loginTextStyle = const TextStyle(color: Colors.white);

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
