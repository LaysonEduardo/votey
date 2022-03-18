import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/camera/camera_controller.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/widgets/buttons.dart';

class CameraView extends GetView<CameraPageController> {
  const CameraView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.black,
        child: controller.obx(
          (state) => Center(
            child: CameraPreview(controller.controller),
          ),
          onLoading: Container(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(10),
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.flash_auto,
                  color: AppColors.primaryLight,
                ),
                CustomRadioButton(
                  onTap: () {},
                  value: true,
                ),
                Icon(
                  Icons.camera_front_outlined,
                  color: AppColors.primaryLight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
