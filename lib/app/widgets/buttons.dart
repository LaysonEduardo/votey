import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/utils/text_styles.dart';

class SimpleButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  // ignore: use_key_in_widget_constructors
  const SimpleButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: AppColors.accent,
      shape: const StadiumBorder(),
      onPressed: () {
        onPressed();
      },
      minWidth: Get.width * 0.4,
      child: Text(
        text,
        style: AppFonts.commom15Light,
      ),
    );
  }
}
