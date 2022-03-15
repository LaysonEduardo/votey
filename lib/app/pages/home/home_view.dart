import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/home/home_controller.dart';
import 'package:votey/app/utils/gradients.dart';
import 'package:votey/app/widgets/buttons.dart';
import 'package:votey/data/repositories/appwrite_repo.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: AppGradients.linearLight,
        ),
        child: Center(
          child: SimpleButton(
              text: 'Sair',
              onPressed: () {
                Get.find<AppWriteCli>().logOut();
              }),
        ),
      ),
    );
  }
}
