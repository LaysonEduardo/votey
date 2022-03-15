import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:votey/app/utils/colors.dart';
import 'package:votey/data/repositories/appwrite_repo.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  await initUIservices();
  await initCliServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Votey',
      theme: ThemeData(
        primaryColor: AppColors.secondaryLight,
        toggleableActiveColor: AppColors.accent,
        fontFamily: 'Nunito',
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
    );
  }
}

initUIservices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
