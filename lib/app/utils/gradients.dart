import 'package:flutter/painting.dart';
import 'package:votey/app/utils/colors.dart';

class AppGradients {
  static final linearLight = LinearGradient(
    colors: [
      AppColors.secondaryLight,
      AppColors.primaryLight,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
  static final linearDark = LinearGradient(
    colors: [
      AppColors.secondaryDark,
      AppColors.primaryDark,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
}
