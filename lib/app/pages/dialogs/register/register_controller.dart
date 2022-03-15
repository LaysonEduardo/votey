import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/domain/entities/user_register_model.dart';

class RegisterController extends GetxController with StateMixin {
  UserRegisterModel user = UserRegisterModel();
  RxStatus registerState = RxStatus.empty();
  final termsAccepted = false.obs;

  validateForm() {
    if (user.name.isEmpty) {
      return false;
    }
    if (user.email.isEmpty || GetUtils.isEmail(user.email) == false) {
      return false;
    }
    if (user.password.isEmpty) {
      return false;
    }

    return true;
  }

  register() {
    if (validateForm() == false) {
      Get.snackbar(
        'Ops',
        'Verifique os campos e tente novamente',
        backgroundColor: AppColors.primaryDark.withOpacity(0.8),
        colorText: Colors.white,
        icon: Icon(
          Icons.error,
          color: AppColors.accent,
        ),
      );
    } else {
      registerState = RxStatus.loading();
      Get.forceAppUpdate();
      Future.delayed(const Duration(seconds: 2), () {
        registerState = RxStatus.success();
      });
    }
  }
}
