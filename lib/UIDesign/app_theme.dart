import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
        fontFamily: 'Ubuntu',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppTheme.orange,
        ),
        // bottomSheetTheme:
        //     const BottomSheetThemeData(backgroundColor: AppTheme.black),
        primaryColor: orange,
        iconTheme: const IconThemeData(color: orange));
  }

  static const orange = Color(0xFFea8f25);
  static const black = Colors.black;
  static const blackLight = Color.fromARGB(255, 86, 85, 85);
  static const white = Colors.white;
  static const grey = Color(0xffC4C4C4);
  static const greyLight = Color.fromARGB(255, 243, 238, 238);
  static const blue = Colors.blue;
  static const red = Colors.red;
  static const green = Colors.green;
  static const purple = Colors.purple;
  static const purpleLight = Color.fromARGB(255, 151, 99, 160);
}
