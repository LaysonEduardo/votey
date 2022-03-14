import 'package:flutter/material.dart';

class AppColors {
  static Color accent = const Color(0xff58A4B0);
  //Light
  static Color primaryLight = const Color(0xffD8DBE2);
  static Color secondaryLight = const Color(0xffA9BCD0);
  //dark
  static Color primaryDark = const Color(0xff373F51);
  static Color secondaryDark = const Color(0xff1B1B1E);
  //
  static isDark(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }
}
