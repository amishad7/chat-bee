// import 'dart:developer';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_project/modules/views/register/views/components/tabs/sign-in/view/sign-in.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'components/tabs/sign-up/view/sign-up.dart';
//
// /*
//               Welcome Screen / Get Started
//               User Information / Account Information
//               Password Setup / Create Password
//               Profile Setup / Complete Your Profile
//               Verification / Verify Your Account
//               Terms and Conditions / Privacy Policy
//               Confirmation / Registration Complete
// */
//
// class Register extends StatelessWidget {
//   const Register({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController name = TextEditingController();
//     TextEditingController passsword = TextEditingController();
//     final User? user = FirebaseAuth.instance.currentUser;
//     final uid = user?.uid;
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextFormField(
//             controller: name,
//             decoration: const InputDecoration(labelText: "name"),
//           ),
//           const SizedBox(height: 56),
//           TextFormField(
//             controller: passsword,
//             decoration: const InputDecoration(labelText: "passsword"),
//           ),
//           const SizedBox(height: 56),
//           ElevatedButton(
//             onPressed: () async {
//               try {
//                 UserCredential userCredential = await FirebaseAuth.instance
//                     .createUserWithEmailAndPassword(
//                         email: 'demo@gmail.com', password: '123456');
//                 userCredential.user;
//               } on FirebaseAuthException catch (e) {
//                 log("${e.code}");
//               }
//             },
//             child: const Text("Create user"),
//           ),
//           ListTile(
//             title: Text("${user?.displayName}"),
//           ),
//         ],
//       ),
//     );
//   }
// }
