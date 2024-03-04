import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool visited = false;
String? password;
String? mail;

List user = [
  {
    'name': 'priya',
    'url':
        'https://i.pinimg.com/564x/d0/df/a5/d0dfa5770ed584c6010025ca398f70ae.jpg',
  },
  {
    'url':
        'https://i.pinimg.com/564x/9e/f4/7e/9ef47e652eacd5c324acb010f3391599.jpg',
    'name': 'moonie',
  },
  {
    'url':
        'https://i.pinimg.com/736x/90/3f/ac/903fac67043136dd3aa1203a21a2edc7.jpg',
    'name': 'aliezy',
  },
];
TextStyle mainFont(
        {Color color = Colors.white,
        FontWeight weight = FontWeight.bold,
        double size = 20}) =>
    GoogleFonts.antic(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );

TextStyle subFont(
        {Color color = Colors.white,
        FontWeight weight = FontWeight.bold,
        double size = 20}) =>
    GoogleFonts.nunito(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );

// BoxDecoration simpleBox = BoxDecoration(
//   borderRadius: BorderRadius.circular(20),
//   color: Colors.white,
//   boxShadow: [
//     BoxShadow(
//       blurRadius: 40,
//       offset: const Offset(16, 0),
//       color: const Color(0xff9aaacf).withAlpha(20),
//     ),
//   ],
// );
