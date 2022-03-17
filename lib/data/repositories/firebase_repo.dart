// ignore_for_file: unused_catch_clause

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:votey/app/widgets/snacksBar.dart';
import 'package:votey/domain/entities/user_register_model.dart';
import '../../app/routes/app_routes.dart';

class FirebaseCli extends GetxService {
  late FirebaseApp defaultApp;
  late FirebaseAuth auth;
  late FirebaseFirestore firestore;
  late CollectionReference users;

  @override
  void onInit() async {
    defaultApp = await Firebase.initializeApp();
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    users = FirebaseFirestore.instance.collection('users');
    getAccount();
    super.onInit();
  }

  createAccount(UserRegisterModel user) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      )
          .then(
        (value) {
          firestoreAddUser(user);
          Get.offAllNamed(AppRoutes.home);
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        errorSnackBar('Essa senha é muito curta');
      } else if (e.code == 'email-already-in-use') {
        errorSnackBar('Email ja cadastrado, tente outro');
      }
    } catch (e) {
      errorSnackBar('Erro desconhecido, tente novamente mais tarde');
    }
  }

  logIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        Get.offAllNamed(AppRoutes.home);
        updateLastLogin();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorSnackBar('Credenciais não existentes');
      } else if (e.code == 'wrong-password') {
        errorSnackBar('Uma ou mais credenciais estão incorretas');
      }
    }
  }

  logOut() async {
    try {
      await auth.signOut().then((value) => {
            Get.offAllNamed(AppRoutes.onboarding),
          });
    } on FirebaseAuthException catch (e) {
      errorSnackBar('Erro desconhecimento, tente novamente mais tarde');
    }
  }

  getAccount() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.offAllNamed(AppRoutes.onboarding);
      if (auth.currentUser == null) {
        Get.offAllNamed(AppRoutes.onboarding);
      } else {
        Get.offAllNamed(AppRoutes.home);
      }
    });
  }

  firestoreAddUser(UserRegisterModel user) {
    users.doc(auth.currentUser!.uid).set(
      {
        'user_name': user.name,
        'email': user.email,
        'accepted_terms': user.acceptedTerms,
        'last_login': DateTime.now(),
        'isPremium': false,
      },
    );
  }

  updateLastLogin() {
    users.doc(auth.currentUser!.uid).update(
      {
        'last_login': DateTime.now(),
      },
    );
  }
}

initCliServices() async {
  debugPrint('starting Firebase Services...');
  await Get.putAsync<FirebaseCli>(() async => FirebaseCli());
  debugPrint('All Firebase services started');
}
