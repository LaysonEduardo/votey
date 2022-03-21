import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/home/home_controller.dart';
import 'package:votey/app/routes/app_routes.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/utils/gradients.dart';
import 'package:votey/app/widgets/custom_appbar.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Olá User',
          style: TextStyle(fontSize: 25, color: AppColors.secondaryLight),
        ),
        actions: [
          Hero(
            tag: 'avatar',
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.settings);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  backgroundColor: AppColors.secondaryLight,
                  foregroundColor: AppColors.primaryDark.withOpacity(0.5),
                  child: const Icon(Icons.person),
                ),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: AppGradients.linearDark,
        ),
        child: Stack(
          children: [],
        ),
      ),
      bottomNavigationBar: CustomAppBar(),
    );
  }
}
