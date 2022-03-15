// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/utils/colors.dart';

errorSnackBar(String message) {
  Get.snackbar(
    'Ops',
    message,
    backgroundColor: AppColors.primaryDark.withOpacity(0.8),
    colorText: Colors.white,
    icon: Icon(
      Icons.error,
      color: AppColors.accent,
    ),
  );
}
