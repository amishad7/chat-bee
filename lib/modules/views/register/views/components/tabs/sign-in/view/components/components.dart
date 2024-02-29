// userNameValidator(value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter something';
//   }
//   return null;
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/Sign-in-controller.dart';

SignInController loginController = Get.put(SignInController());
// final _loginFormFieldKey = GlobalKey<FormFieldState>();

TextStyle loginTextStyle(
        {Color color = Colors.white,
        FontWeight weight = FontWeight.bold,
        double size = 20}) =>
    TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
var seePassword = loginController.model.password;
