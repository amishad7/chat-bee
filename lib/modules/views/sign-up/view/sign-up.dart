import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../login/view/components/components.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var seePassword = loginController.model.password;
    final _signupFormFieldKey = GlobalKey<FormFieldState>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Form(
                key: _signupFormFieldKey,
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(100, 23),
                      child: Container(
                        height: Get.height / 13,
                        width: Get.width / 2.8,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueAccent.withOpacity(0.4),
                              blurRadius: 10,
                              // blurStyle: BlurStyle.inner,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "SIGN UP",
                          style: GoogleFonts.antic(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, 123),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueAccent.withOpacity(0.4),
                        ),
                        child: TextFormField(
                          //    validator: userNameValidator(context),
                          controller: username,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: loginTextStyle,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            alignLabelWithHint: true,
                            hintText: "user name",
                            suffixIcon: Icon(
                              Icons.person_add,
                              color: Colors.white,
                            ),
                            hintFadeDuration: Duration(milliseconds: 1000),
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, 200),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blueAccent.withOpacity(0.4),
                        ),
                        child: Obx(
                          () => TextFormField(
                            style: loginTextStyle,
                            controller: password,

                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            //   validator: userNameValidator(context),
                            obscureText: seePassword.value,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              alignLabelWithHint: true,
                              hintText: "password",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginController.hidePassword();
                                  log('${seePassword.value}');
                                },
                                icon: (seePassword.value)
                                    ? const Icon(
                                        Icons.lock_outline,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.lock_open_rounded,
                                        color: Colors.white,
                                      ),
                              ),
                              hintFadeDuration:
                                  const Duration(milliseconds: 1000),
                              hintStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(110, 300),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height / 19,
                          width: Get.width / 4,

                          // margin: const EdgeInsets.symmetric(horizontal: 20),
                          //padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blueAccent.withOpacity(0.4),
                          ),
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
