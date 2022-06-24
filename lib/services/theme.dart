import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

const Color darkkk = Color(0xff181818);
const Color darkk = Color(0xff212222);
const Color dark = Color(0xff4d4d4d);
const Color blueDatk = Color(0xff78a6c8);
const Color whitee = Color(0xffeaedf2);
const Color redish = Color(0xffe75b4e);

class AppThemes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}

// TextStyle get headingStyle {
//   return GoogleFonts.lato(
//     textStyle: TextStyle(
//       fontSize: 30,
//       fontWeight: FontWeight.bold,
//       color: Get.isDarkMode ? Colors.white : Colors.black,
//     ),
//   );
// }

// TextStyle get subHeadingStyle {
//   return GoogleFonts.lato(
//     textStyle: TextStyle(
//       fontSize: 20,
//       fontWeight: FontWeight.bold,
//       color: Get.isDarkMode ? Colors.white : Colors.black,
//     ),
//   );
// }

// TextStyle get titileStyle {
//   return GoogleFonts.lato(
//     textStyle: TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//       color: Get.isDarkMode ? Colors.white : Colors.black,
//     ),
//   );
// }

// TextStyle get subTitileStyle {
//   return GoogleFonts.lato(
//     textStyle: TextStyle(
//       fontSize: 17,
//       fontWeight: FontWeight.w400,
//       color: Get.isDarkMode ? Colors.white : Colors.black,
//     ),
//   );
// }

// TextStyle get bodyStyle {
//   return GoogleFonts.lato(
//     textStyle: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: Get.isDarkMode ? Colors.white : Colors.black,
//     ),
//   );
// }

// TextStyle get body2Style {
//   return GoogleFonts.lato(
//     textStyle: TextStyle(
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
//     ),
//   );
// }
