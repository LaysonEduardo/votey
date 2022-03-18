import 'package:get/get.dart';
import 'package:votey/app/pages/camera/camera_controller.dart';

class CameraModule implements Bindings {
  @override
  void dependencies() {
    Get.put(CameraPageController());
  }
}
