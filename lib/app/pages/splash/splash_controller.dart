import 'package:get/get.dart';
import 'package:votey/data/repositories/firebase_repo.dart';
import 'package:votey/device/repositories/device_actions_repo.dart';

class SplashController extends GetxController {
  DeviceActions deviceActions;
  SplashController({required this.deviceActions});

  @override
  void onInit() async {
    Future.delayed(Duration(seconds: 5), () async {
      await initCliServices();
    });
    super.onInit();
  }
  //
}
