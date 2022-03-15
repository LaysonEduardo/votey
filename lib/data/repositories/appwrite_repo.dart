import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:votey/app/routes/app_routes.dart';
import 'package:votey/domain/entities/user_register_model.dart';

class AppWriteCli extends GetxService {
  final storage = SharedPreferences.getInstance();
  Client client = Client();
  Account? account;

  @override
  void onInit() {
    client.setEndpoint('http://192.168.1.66/v1').setProject('622e4d09dd1a4829385e');
    account = Account(client);
    super.onInit();
  }

  createAccount(UserRegisterModel user) async {
    try {
      await account
          ?.create(
        userId: const Uuid().v1(),
        name: user.name,
        email: user.email,
        password: user.password,
      )
          .then((value) {
        logIn(user.email, user.password);
      });
    } on AppwriteException catch (e) {
      debugPrint(e.message);
    }
  }

  logIn(String email, String password) async {
    try {
      account?.createSession(email: email, password: password).then((value) {
        Get.offAllNamed(AppRoutes.home);
      });
    } on AppwriteException catch (e) {
      debugPrint(e.message);
    }
  }

  logOut() {
    try {
      account?.deleteSession(sessionId: 'current').then((value) {
        Get.offAllNamed(AppRoutes.onboarding);
      });
    } on AppwriteException catch (e) {
      debugPrint(e.message);
    }
  }

  getAccount() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final response = account?.get();
      response
          ?.then((value) => {
                Get.offAllNamed(AppRoutes.home),
              })
          .onError(
            (error, _) => {Get.offAllNamed(AppRoutes.onboarding)},
          );
    });
  }
}

initCliServices() async {
  debugPrint('starting AppWrite Services...');
  await Get.putAsync<AppWriteCli>(() async => AppWriteCli());
  debugPrint('All AppWrite services started');
}
