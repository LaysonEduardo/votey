import 'package:flutter/cupertino.dart';
import 'package:votey/app/utils/colors.dart';

class AppFonts {
  static TextStyle commom15Light = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 15,
    color: AppColors.primaryDark,
  );
  static TextStyle commom15Dark = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 15,
    color: AppColors.primaryLight,
  );
  static TextStyle commomLight = TextStyle(
    fontWeight: FontWeight.w800,
    color: AppColors.primaryDark,
    fontSize: 20,
    letterSpacing: 1.0,
  );
  static TextStyle commomDark = TextStyle(
    fontWeight: FontWeight.w800,
    color: AppColors.primaryLight,
    fontSize: 20,
    letterSpacing: 1.0,
  );
}
