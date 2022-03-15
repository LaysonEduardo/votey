// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:votey/app/utils/colors.dart';

class SimpleInput extends StatelessWidget {
  String label;
  IconData icon;
  String? currentText;
  var onChaged;
  SimpleInput({Key? key, required this.label, required this.icon, required this.onChaged, this.currentText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.secondaryLight,
          width: 1,
        ),
      ),
      child: TextFormField(
        cursorColor: AppColors.accent,
        initialValue: currentText,
        style: TextStyle(color: AppColors.secondaryLight),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            color: AppColors.secondaryLight,
          ),
          contentPadding: const EdgeInsets.all(10),
          icon: Icon(
            icon,
            color: AppColors.secondaryLight,
          ),
          border: InputBorder.none,
        ),
        onChanged: onChaged,
      ),
    );
  }
}

class PasswordInput extends StatefulWidget {
  var onChaged;
  String? currentText;

  PasswordInput({Key? key, required this.onChaged, this.currentText}) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.secondaryLight,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              cursorColor: AppColors.accent,
              obscureText: hidePassword,
              initialValue: widget.currentText,
              style: TextStyle(color: AppColors.secondaryLight),
              decoration: InputDecoration(
                hintText: 'Senha',
                hintStyle: TextStyle(
                  color: AppColors.secondaryLight,
                ),
                contentPadding: const EdgeInsets.all(10),
                icon: Icon(
                  Icons.lock,
                  color: AppColors.secondaryLight,
                ),
                border: InputBorder.none,
              ),
              onChanged: widget.onChaged,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            child: Icon(!hidePassword ? Icons.visibility_off_rounded : Icons.remove_red_eye_rounded, color: AppColors.secondaryLight),
          )
        ],
      ),
    );
  }
}
