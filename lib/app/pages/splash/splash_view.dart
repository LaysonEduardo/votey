import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/splash/splash_controller.dart';
import 'package:votey/app/utils/gradients.dart';
import 'package:votey/app/widgets/loadings.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(gradient: AppGradients.linearDark),
          ),
          Center(
            child: SimpleLoading(height: 250),
          ),
          Center(
            child: SvgPicture.asset('assets/images/logo_simple_dark.svg', width: Get.width * 0.2),
          )
        ],
      ),
    );
  }
}
