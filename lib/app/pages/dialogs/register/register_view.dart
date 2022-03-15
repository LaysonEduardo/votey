import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/dialogs/register/register_controller.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/app/widgets/buttons.dart';

import '../../../widgets/custom_dialog.dart';

class RegisterDialog extends GetView<RegisterController> {
  RegisterDialog({Key? key}) : super(key: key);
  @override
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return controller.registerState == RxStatus.loading()
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondaryLight,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: AppColors.accent,
                    decoration: InputDecoration(
                      hintText: 'Seu nome',
                      hintStyle: TextStyle(
                        color: AppColors.secondaryLight,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      icon: Icon(
                        Icons.person,
                        color: AppColors.secondaryLight,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (str) {
                      controller.user.name = str;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondaryLight,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: AppColors.accent,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: AppColors.secondaryLight,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      icon: Icon(
                        Icons.alternate_email_rounded,
                        color: AppColors.secondaryLight,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (str) {
                      controller.user.email = str;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.secondaryLight,
                      width: 1,
                    ),
                  ),
                  child: TextFormField(
                    cursorColor: AppColors.accent,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      hintStyle: TextStyle(
                        color: AppColors.secondaryLight,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      icon: Icon(
                        Icons.lock,
                        color: AppColors.secondaryLight,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (str) {
                      controller.user.password = str;
                    },
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () {
                        return Checkbox(
                          value: controller.termsAccepted.value,
                          onChanged: (value) {
                            controller.termsAccepted.value = value!;
                          },
                          shape: const CircleBorder(),
                        );
                      },
                    ),
                    const Text(
                      'Aceitar termos e condições',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SimpleButton(
                    text: 'Cadastrar',
                    onPressed: () {
                      controller.register();
                    }),
              ],
            ),
          );
  }
}

registerDialog(BuildContext context) {
  customDialog(
    context,
    Icons.account_circle,
    'Criar conta',
    RegisterDialog(),
  );
}
