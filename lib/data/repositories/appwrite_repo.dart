import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/routes/app_routes.dart';
import 'package:votey/app/widgets/snacksBar.dart';

class AppWriteCli extends GetxService {
  Client client = Client();
  late Account account;

  @override
  void onInit() {
    client.setEndpoint('https://192.168.1.66:443/v1').setProject('622e4d09dd1a4829385e').setSelfSigned(status: true);
    account = Account(client);
    checkSession();
    super.onInit();
  }

  logIn(String email, String password) async {
    try {
      await account.createSession(email: email, password: password).then((value) {
        Get.offAllNamed(AppRoutes.home);
      });
    } on AppwriteException catch (e) {
      print(e);
      errorSnackBar(e.message ?? 'login error');
    }
  }

  logOut() async {
    try {
      await account.deleteSession(sessionId: 'current').then((value) {
        Get.offAllNamed(AppRoutes.onboarding);
      });
    } on AppwriteException catch (e) {
      print(e);
      errorSnackBar(e.message ?? 'logout error');
    }
  }

  checkSession() async {
    try {
      await account.getSession(sessionId: 'current');
      Get.offAllNamed(AppRoutes.home);
    } on AppwriteException catch (e) {
      print(e);
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }
}

initAppWriteServices() async {
  debugPrint(
    'starting AppWrite Services...',
  );
  await Get.putAsync<AppWriteCli>(() async => AppWriteCli());
  debugPrint('All AppWrite services started');
}
