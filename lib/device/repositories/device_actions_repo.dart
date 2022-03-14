import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:votey/app/routes/app_routes.dart';

class DeviceActions extends GetxService {
  isFirstAccess() async {
    final storage = await SharedPreferences.getInstance();
    await storage.setBool('isFirstAccess', true);

    bool? isFirst = storage.getBool('isFirstAccess');
    if (isFirst == null || isFirst == true) {
      await storage.setBool('isFirstAccess', false);
      Get.toNamed(AppRoutes.onboarding);
    }
  }

  @override
  void onInit() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      isFirstAccess();
    });
    super.onInit();
  }
}
