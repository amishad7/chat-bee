import 'package:firebase_project/modules/utils/globals/colors.dart';
import 'package:firebase_project/modules/utils/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/004/681/617/non_2x/dynamic-background-with-fluid-shapes-modern-concept-for-minimalist-poster-design-abstract-flat-design-for-presentation-free-photo.jpg',
                  ),
                ),
                border: Border.all(color: Colors.white, width: 12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    offset: const Offset(16, 0),
                    color: const Color(0xff9aaacf).withAlpha(20),
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
