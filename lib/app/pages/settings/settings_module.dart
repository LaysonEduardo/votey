import 'package:get/get.dart';
import 'package:votey/app/pages/settings/settings_controller.dart';

class SettingsModule implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}
