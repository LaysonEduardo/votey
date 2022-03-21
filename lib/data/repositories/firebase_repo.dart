// ignore_for_file: unused_catch_clause

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/domain/entities/user_register_model.dart';
import '../../app/routes/app_routes.dart';

class FirebaseCli extends GetxService {
  late FirebaseApp defaultApp;
  // late FirebaseAuth auth;
  // late FirebaseFirestore firestore;
  // late CollectionReference users;
  late FirebaseRemoteConfig firebaseRemoteConfig;
  late FirebaseAnalytics analytics;
  late FirebaseMessaging messaging;
  late NotificationSettings settings;

  @override
  void onInit() async {
    defaultApp = await Firebase.initializeApp();
    // auth = FirebaseAuth.instance;
    messaging = FirebaseMessaging.instance;
    // firestore = FirebaseFirestore.instance;
    analytics = FirebaseAnalytics.instance;
    settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // users = FirebaseFirestore.instance.collection('users');

    // firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    // await firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
    //   fetchTimeout: Duration(seconds: 10),
    //   minimumFetchInterval: Duration(seconds: 10),
    // ));
    // await firebaseRemoteConfig.fetchAndActivate();
    // users = FirebaseFirestore.instance.collection('users');
    // firebaseRemoteConfig.setDefaults(<String, dynamic>{
    //   'welcome_message': 'Bem vindo ao Votey\numa plataforma para quem quer facilitar a tomada de decisão entre grupos',
    //   'feat1_enabled': false,
    // });
    String? test = await messaging.getToken();
    print(test);
    // getAccount();
    listenNotificationForeground();
    super.onInit();
  }

  // createAccount(UserRegisterModel user) async {
  //   try {
  //     await auth
  //         .createUserWithEmailAndPassword(
  //       email: user.email,
  //       password: user.password,
  //     )
  //         .then(
  //       (value) async {
  //         await analytics.logSignUp(signUpMethod: 'email');
  //         firestoreAddUser(user);
  //         Get.offAllNamed(AppRoutes.home);
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       errorSnackBar('Essa senha é muito curta');
  //     } else if (e.code == 'email-already-in-use') {
  //       errorSnackBar('Email ja cadastrado, tente outro');
  //     }
  //   } catch (e) {
  //     print(e);
  //     errorSnackBar('Erro desconhecido, tente novamente mais tarde');
  //   }
  // }

  // logIn(String email, String password) async {
  //   try {
  //     await auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
  //       Get.offAllNamed(AppRoutes.home);
  //       updateLastLogin();
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       errorSnackBar('Credenciais não existentes');
  //     } else if (e.code == 'wrong-password') {
  //       errorSnackBar('Uma ou mais credenciais estão incorretas');
  //     }
  //   }
  // }

  // logOut() async {
  //   try {
  //     await auth.signOut().then((value) => {
  //           Get.offAllNamed(AppRoutes.onboarding),
  //         });
  //   } on FirebaseAuthException catch (e) {
  //     errorSnackBar('Erro desconhecimento, tente novamente mais tarde');
  //   }
  // }

  // getAccount() async {
  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     Get.offAllNamed(AppRoutes.onboarding);
  //     if (auth.currentUser == null) {
  //       Get.offAllNamed(AppRoutes.onboarding);
  //     } else {
  //       Get.offAllNamed(AppRoutes.home);
  //     }
  //   });
  // }

  // firestoreAddUser(UserRegisterModel user) {
  //   users.doc(auth.currentUser!.uid).set(
  //     {
  //       'user_name': user.name,
  //       'email': user.email,
  //       'accepted_terms': user.acceptedTerms,
  //       'last_login': DateTime.now(),
  //       'isPremium': false,
  //     },
  //   );
  // }

  // updateLastLogin() {
  //   users.doc(auth.currentUser!.uid).update(
  //     {
  //       'last_login': DateTime.now(),
  //     },
  //   );
  // }
}

listenNotificationForeground() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        title: message.notification!.title,
        body: message.notification!.body,
      ));
    }
  });
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print('Handling a background message: ${message.notification!.title}');
}

initCliServices() async {
  debugPrint('starting Firebase Services...');
  await Get.putAsync<FirebaseCli>(() async => FirebaseCli());
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  debugPrint('All Firebase services started');
}
