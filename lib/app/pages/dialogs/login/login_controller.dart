import 'package:get/get.dart';
import 'package:votey/app/widgets/snacksBar.dart';
import 'package:votey/data/repositories/appwrite_repo.dart';
import 'package:votey/data/repositories/firebase_repo.dart';
import 'package:votey/domain/entities/user_register_model.dart';

class LoginController extends GetxController with StateMixin {
  UserRegisterModel user = UserRegisterModel();

  @override
  void onInit() {
    change([], status: RxStatus.success());
    super.onInit();
  }

  validateForm() {
    if (user.email.isEmpty || GetUtils.isEmail(user.email) == false) {
      errorSnackBar('Verifique seu Email e tente novamente');

      return false;
    }
    if (user.password.isEmpty) {
      errorSnackBar('Sua senha não pode ser vazia');

      return false;
    }

    return true;
  }

  login() {
    Get.focusScope!.unfocus();
    if (validateForm() == true) {
      change([], status: RxStatus.loading());
      Get.find<AppWriteCli>().logIn(user.email, user.password);
      Future.delayed(const Duration(seconds: 2), () {
        change([], status: RxStatus.success());
      });
    }
  }
}
