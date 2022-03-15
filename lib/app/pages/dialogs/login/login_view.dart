import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/pages/dialogs/login/login_controller.dart';
import 'package:votey/app/widgets/buttons.dart';
import 'package:votey/app/widgets/custom_inputs.dart';
import 'package:votey/app/widgets/loadings.dart';
import '../../../widgets/custom_dialog.dart';

class LoginDialog extends GetView<LoginController> {
  LoginDialog({Key? key}) : super(key: key);
  @override
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Column(
        children: [
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
          const Text('Esqueci a senha'),
          SimpleButton(
            text: 'Entrar',
            onPressed: () {
              controller.login();
            },
          ),
        ],
      ),
      onLoading: SimpleLoading(height: Get.height * 0.2),
    );
  }
}

loginDialog(BuildContext context) {
  customDialog(
    context,
    Icons.logout_outlined,
    'Entrar',
    LoginDialog(),
  );
}
