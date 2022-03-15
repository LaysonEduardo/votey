import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/dialogs/register/register_controller.dart';
import 'package:votey/app/widgets/buttons.dart';
import 'package:votey/app/widgets/custom_inputs.dart';
import 'package:votey/app/widgets/loadings.dart';
import '../../../widgets/custom_dialog.dart';

class RegisterDialog extends GetView<RegisterController> {
  RegisterDialog({Key? key}) : super(key: key);
  @override
  final controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Form(
        child: Column(
          children: [
            SimpleInput(
              label: 'Seu nome',
              icon: Icons.person,
              currentText: controller.user.name,
              onChaged: (str) {
                controller.user.name = str;
              },
            ),
            SimpleInput(
              label: 'Email',
              icon: Icons.person,
              currentText: controller.user.email,
              onChaged: (str) {
                controller.user.email = str;
              },
            ),
            PasswordInput(
              onChaged: (str) {
                controller.user.password = str;
              },
              currentText: controller.user.password,
            ),
            Row(
              children: [
                Obx(
                  () {
                    return Checkbox(
                      value: controller.termsAccepted.value,
                      onChanged: (value) {
                        controller.termsAccepted.value = value!;
                        controller.user.acceptedTerms = value;
                      },
                      shape: const CircleBorder(),
                    );
                  },
                ),
                const Text(
                  'Eu aceito os termos e condições.',
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
      ),
      onLoading: SimpleLoading(height: Get.height * 0.2),
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
