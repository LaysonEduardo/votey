import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/onboarding/onboarding_controller.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/utils/gradients.dart';
import 'package:votey/app/utils/text_styles.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: AppColors.isDark(context) ? AppGradients.linearDark : AppGradients.linearLight,
            ),
          ),
          SizedBox(
            height: Get.height * 0.7,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/images/business_meet.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: FlutterLogo(size: 100),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Text(
                        'Bem vindo ao Votey\numa plataforma para quem quer facilitar a tomada de decisão entre grupos.',
                        style: AppColors.isDark(Get.context!) ? AppFonts.commomDark : AppFonts.commomLight,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    MaterialButton(
                      color: AppColors.accent,
                      shape: const StadiumBorder(),
                      onPressed: controller.loginButton,
                      minWidth: Get.width * 0.4,
                      child: Text(
                        'Login',
                        style: AppFonts.commom15Light,
                      ),
                    ),
                    MaterialButton(
                      color: AppColors.accent,
                      shape: const StadiumBorder(),
                      onPressed: controller.registerButton,
                      minWidth: Get.width * 0.4,
                      child: Text(
                        'Cadastro',
                        style: AppFonts.commom15Light,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
