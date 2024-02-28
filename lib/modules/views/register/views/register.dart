import 'package:firebase_project/modules/views/register/views/components/tabs/sign-in/view/sign-in.dart';
import 'package:flutter/material.dart';
import 'components/tabs/sign-up/view/sign-up.dart';

/*
              Welcome Screen / Get Started
              User Information / Account Information
              Password Setup / Create Password
              Profile Setup / Complete Your Profile
              Verification / Verify Your Account
              Terms and Conditions / Privacy Policy
              Confirmation / Registration Complete
*/

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            SignupView(),
            SignInView(),
          ],
        ),
      ),
    );
  }
}
