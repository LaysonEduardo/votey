import 'package:get/get.dart';
import 'package:votey/data/repositories/appwrite_repo.dart';
import 'package:votey/data/repositories/firebase_repo.dart';
import 'package:votey/device/repositories/device_actions_repo.dart';

class SplashController extends GetxController {
  DeviceActions deviceActions;
  SplashController({required this.deviceActions});

  @override
  void onInit() async {
    Future.delayed(const Duration(seconds: 5), () async {
      await initCliServices();
      await initAppWriteServices();
    });
    super.onInit();
  }
}
