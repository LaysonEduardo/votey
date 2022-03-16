import 'package:get/get.dart';
import 'package:votey/app/pages/home/home_module.dart';
import 'package:votey/app/pages/onboarding/onboarding_module.dart';
import 'package:votey/app/pages/settings/settings_module.dart';
import 'package:votey/app/pages/settings/settings_view.dart';
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
      page: () => HomeView(),
      binding: HomeModule(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingModule(),
    ),
    //gerenrate getpage settings
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: SettingsModule(),
      transition: Transition.native,
    )
  ];
}
