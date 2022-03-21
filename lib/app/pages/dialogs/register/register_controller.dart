import 'package:get/get.dart';
import 'package:votey/app/widgets/snacksBar.dart';
import 'package:votey/domain/entities/user_register_model.dart';

import '../../../../data/repositories/firebase_repo.dart';

class RegisterController extends GetxController with StateMixin {
  UserRegisterModel user = UserRegisterModel();
  final termsAccepted = false.obs;

  validateForm() {
    if (user.name.isEmpty) {
      errorSnackBar('Seu nome não pode ser nulo');

      return false;
    }
    if (user.email.isEmpty || GetUtils.isEmail(user.email) == false) {
      errorSnackBar('Verifique seu Email e tente novamente');

      return false;
    }
    if (user.password.isEmpty) {
      errorSnackBar('Sua senha não pode ser vazia');

      return false;
    }
    if (termsAccepted.value == false) {
      errorSnackBar('Você precisa aceitar os termos e condições');

      return false;
    }

    return true;
  }

  register() async {
    Get.focusScope!.unfocus();
    if (validateForm() == true) {
      change([], status: RxStatus.loading());
      // await Get.find<FirebaseCli>().createAccount(user);
      Future.delayed(const Duration(seconds: 2), () {
        change([], status: RxStatus.success());
      });
    }
  }

  @override
  void onInit() {
    change([], status: RxStatus.success());
    super.onInit();
  }
}
