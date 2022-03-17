// ignore_for_file: prefer_typing_uninitialized_variables

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

// ignore: must_be_immutable
class MenuButton extends StatelessWidget {
  Widget leading;
  Widget body;
  Widget action;
  var onTap;

  MenuButton({Key? key, required this.action, required this.body, required this.leading, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            border: Border.all(
              color: AppColors.accent,
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
      ),
    );
  }
}

// ignore: must_be_immutable
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

class CustomRadioButton extends StatefulWidget {
  bool value;
  Function(bool?) onTap;
  CustomRadioButton({Key? key, required this.onTap, required this.value}) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 20,
            width: 20,
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppColors.accent,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: widget.value ? 1 : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
