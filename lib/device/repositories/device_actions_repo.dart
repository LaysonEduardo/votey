import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votey/app/routes/app_routes.dart';

class DeviceActions extends GetxService {
  isLogged() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 4), () async {
        final storage = await SharedPreferences.getInstance();
        String? userToken = storage.getString('userToken');
        if (userToken == null) {
          Get.offAllNamed(AppRoutes.onboarding);
        } else {
          Get.offAllNamed(AppRoutes.home);
        }
      });
    });
  }
}
