import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/widgets/buttons.dart';
import 'package:votey/app/widgets/custom_dialog.dart';

import '../../../data/repositories/firebase_repo.dart';

class SettingsController extends GetxController {
  logout() {
    customDialog(
      Get.context!,
      Icons.logout,
      'Sair',
      Column(
        children: [
          Text(
            'Você realmente deseja sair?',
            style: TextStyle(fontSize: 25, color: AppColors.secondaryLight),
          ),
          SimpleButton(
            text: 'Sim',
            onPressed: Get.find<FirebaseCli>().logOut,
          ),
        ],
      ),
    );
  }
}
