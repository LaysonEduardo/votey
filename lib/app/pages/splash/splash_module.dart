import 'package:get/get.dart';
import 'package:votey/app/pages/splash/splash_controller.dart';
import 'package:votey/device/repositories/device_actions_repo.dart';

class SplashModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeviceActions());
    Get.put(SplashController(deviceActions: Get.find()));
  }
}
