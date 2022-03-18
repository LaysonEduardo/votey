import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraPageController extends GetxController with StateMixin {
  late List<CameraDescription> cameras;
  late CameraController controller;

  @override
  void onInit() async {
    change([], status: RxStatus.loading());
    cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.ultraHigh);
    await controller.initialize().then((value) {
      change([], status: RxStatus.success());
    });
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
