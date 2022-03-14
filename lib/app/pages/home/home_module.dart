import 'package:get/get.dart';
import 'package:votey/app/pages/home/home_controller.dart';
import 'package:votey/device/repositories/device_actions_repo.dart';

class HomeModule implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeviceActions());
    Get.put(HomeController(deviceActions: Get.find()));
  }
}
