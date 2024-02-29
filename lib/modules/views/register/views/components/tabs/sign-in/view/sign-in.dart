import 'dart:developer';
import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'components/components.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    var seePassword = loginController.model.password;
    final _loginFormFieldKey = GlobalKey<FormFieldState>();

    return Scaffold(
      backgroundColor: widgetColor,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, right: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackButton(
                        color: Colors.black.withOpacity(0.8),
                      ),
                      Text(
                        "Register",
                        style: mainFont(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-100, 30),
                  child: Text(
                    "Sign In",
                    style: subFont(
                      color: Colors.black,
                      size: 40,
                      weight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Expanded(
          //   flex: 2,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(40),
          //         topRight: Radius.circular(40),
          //       ),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.3),
          //           blurRadius: 20,
          //         ),
          //       ],
          //     ),
          //     child: Form(
          //       key: _loginFormFieldKey,
          //       child: Stack(
          //         children: [
          //           Column(
          //             mainAxisAlignment: MainAxisAlignment.start,
          //             children: [
          //               Transform.translate(
          //                 offset: const Offset(0, 123),
          //
          //                 //TODO: DECORATE CONTAINER FAIRY
          //
          //                 child: Container(
          //                   margin: const EdgeInsets.symmetric(horizontal: 20),
          //                   padding: const EdgeInsets.symmetric(horizontal: 20),
          //                   decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(30),
          //                     color: const Color(0xffeeeeee),
          //                     // color: const Color(0xffeeeeee),
          //                   ),
          //                   child: TextFormField(
          //                     //    validator: userNameValidator(context),
          //                     controller: username,
          //                     cursorColor: Color(0xffc9c9c9),
          //
          //                     autovalidateMode:
          //                         AutovalidateMode.onUserInteraction,
          //                     style: loginTextStyle(
          //                         color: Colors.black,
          //                         weight: FontWeight.normal),
          //                     decoration: const InputDecoration(
          //                       border: OutlineInputBorder(
          //                         borderSide: BorderSide.none,
          //                       ),
          //                       alignLabelWithHint: true,
          //                       hintText: "user name",
          //                       hintFadeDuration: Duration(milliseconds: 1000),
          //                       hintStyle: TextStyle(
          //                         color: Color(0xffc9c9c9),
          //                         fontSize: 19,
          //                         fontWeight: FontWeight.normal,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               // Transform.translate(
          //               //   offset: const Offset(0, 200),
          //               //   child: Container(
          //               //     margin: const EdgeInsets.symmetric(horizontal: 20),
          //               //     padding: const EdgeInsets.symmetric(horizontal: 20),
          //               //     decoration: BoxDecoration(
          //               //       borderRadius: BorderRadius.circular(30),
          //               //       color: Colors.blueAccent.withOpacity(0.4),
          //               //     ),
          //               //     child: Obx(
          //               //       () => TextFormField(
          //               //         style: loginTextStyle(),
          //               //         controller: password,
          //               //
          //               //         autovalidateMode:
          //               //             AutovalidateMode.onUserInteraction,
          //               //         //   validator: userNameValidator(context),
          //               //         obscureText: seePassword.value,
          //               //         decoration: InputDecoration(
          //               //           border: const OutlineInputBorder(
          //               //             borderSide: BorderSide.none,
          //               //           ),
          //               //           alignLabelWithHint: true,
          //               //           hintText: "password",
          //               //           suffixIcon: IconButton(
          //               //             onPressed: () {
          //               //               loginController.hidePassword();
          //               //               log('${seePassword.value}');
          //               //             },
          //               //             icon: (seePassword.value)
          //               //                 ? const Icon(
          //               //                     Icons.lock_outline,
          //               //                     color: Colors.white,
          //               //                   )
          //               //                 : const Icon(
          //               //                     Icons.lock_open_rounded,
          //               //                     color: Colors.white,
          //               //                   ),
          //               //           ),
          //               //           hintFadeDuration:
          //               //               const Duration(milliseconds: 1000),
          //               //           hintStyle: const TextStyle(
          //               //             color: Colors.white,
          //               //             fontSize: 16,
          //               //           ),
          //               //         ),
          //               //       ),
          //               //     ),
          //               //   ),
          //               // ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   flex: 2,
          //   child: Container(
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.3),
          //           blurRadius: 20,
          //         ),
          //       ],
          //     ),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         FilledButton(
          //           style: FilledButton.styleFrom(
          //             backgroundColor: Colors.blue,
          //             shape: const StadiumBorder(),
          //             // padding: EdgeInsets.only(top: 40),
          //             elevation: 25,
          //             shadowColor: Colors.blueAccent.withOpacity(0.5),
          //             fixedSize: const Size(270, 50),
          //           ),
          //           onPressed: () {},
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 "Google",
          //                 style: mainFont(),
          //               ),
          //               const FaIcon(FontAwesomeIcons.google),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
