import 'package:get/get.dart';
import 'package:votey/app/pages/onboarding/onboarding_controller.dart';

class OnboardingModule implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingController());
  }
}
