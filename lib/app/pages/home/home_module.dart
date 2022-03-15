import 'package:get/get.dart';
import 'package:votey/app/pages/home/home_controller.dart';

class HomeModule implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
