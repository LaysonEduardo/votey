import 'package:get/get.dart';
import 'package:votey/app/pages/home/home_module.dart';
import 'package:votey/app/pages/onboarding/onboarding_module.dart';
import 'package:votey/app/pages/splash/splash_module.dart';
import 'package:votey/app/pages/splash/splash_view.dart';
import '../pages/home/home_view.dart';
import '../pages/onboarding/onboarding_view.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashModule(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeModule(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingPage(),
      binding: OnboardingModule(),
      transition: Transition.fade,
    ),
  ];
}
