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

class MenuButton extends StatelessWidget {
  Widget leading;
  Widget body;
  Widget action;

  MenuButton({Key? key, required this.action, required this.body, required this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          border: Border.all(
            color: AppColors.secondaryLight,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                leading,
                body,
              ],
            ),
            action
          ],
        ),
      ),
    );
  }
}

class SimpleMenuButton extends StatelessWidget {
  Widget leading;
  Widget body;
  Widget action;
  var onPressed;
  SimpleMenuButton({Key? key, required this.action, required this.body, required this.leading, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  leading,
                  body,
                ],
              ),
              action
            ],
          ),
        ),
      ),
    );
  }
}
