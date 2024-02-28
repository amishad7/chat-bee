import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:firebase_project/modules/views/intro/view/components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: widgetColor,
                  child: const Text(
                    "LOGO + ICON",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: widgetColor,
                boxShadow: [
                  BoxShadow(
                    color: widgetColor.withAlpha(20),
                    blurRadius: 40,
                    // blurStyle: BlurStyle.inner,
                    offset: const Offset(0, 20),
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Stack(
                children: [
                  Transform.translate(
                    offset: const Offset(50, 83),
                    child: Text(
                      "Welcome",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(10, 120),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "Explore our features with ease and enjoy your experience. Thank you for joining us!",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(00, 290),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: Size(140, 50),
                            elevation: 20,
                          ),
                          onPressed: () {},
                          child: const Text('Sign in'),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 20,
                            fixedSize: Size(140, 50),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
