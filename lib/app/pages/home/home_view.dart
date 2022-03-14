import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/home/home_controller.dart';
import 'package:votey/app/utils/gradients.dart';

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
      ),
    );
  }
}
