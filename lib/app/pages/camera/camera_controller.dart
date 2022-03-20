import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraPageController extends GetxController with StateMixin {
  late List<CameraDescription> cameras;
  late CameraController controller;

  @override
  void onInit() async {
    await initCamera();
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  initCamera() async {
    change([], status: RxStatus.loading());
    cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.ultraHigh);
    await controller.initialize().then((value) {
      change([], status: RxStatus.success());
    });
  }

  takePicture() async {
    await controller.takePicture().then((value) {
      Get.snackbar('Picture Taken', 'Picture Taken');
    });
  }

  turnFlash() {}
  changeCamera() {
    controller.dispose();
    controller = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    controller.initialize().then((value) {
      controller.startImageStream((CameraImage image) {});
    });
  }
}
