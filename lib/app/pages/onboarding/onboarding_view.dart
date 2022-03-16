import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/dialogs/login/login_view.dart';
import 'package:votey/app/pages/dialogs/register/register_view.dart';
import 'package:votey/app/pages/onboarding/onboarding_controller.dart';
import 'package:votey/app/utils/gradients.dart';
import 'package:votey/app/utils/text_styles.dart';
import 'package:votey/app/widgets/buttons.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: AppGradients.linearDark,
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
                    'assets/images/onboarding_background.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/images/logo_dark.svg', width: Get.width * 0.5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Text(
                        'Bem vindo ao Votey\numa plataforma para quem quer facilitar a tomada de decisão entre grupos',
                        style: AppFonts.commomDark,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SimpleButton(
                      text: 'Entrar',
                      onPressed: () {
                        loginDialog(context);
                      },
                    ),
                    SimpleButton(
                      text: 'Cadastro',
                      onPressed: () {
                        registerDialog(context);
                      },
                    )
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
