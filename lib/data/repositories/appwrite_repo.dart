import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWriteRepo extends GetxService {
  Client client = Client();
  late Account account;

  @override
  void onInit() {
    client.setEndpoint('https://192.168.1.66:443/v1').setProject('622e4d09dd1a4829385e').setSelfSigned(status: true);
    account = Account(client);
    testRequest();
    super.onInit();
  }

  testRequest() async {
    await account.create(
      userId: '1231',
      email: 'me@appwrite.io',
      password: 'password',
      name: 'My Name',
    );
  }
}

initAppWriteServices() async {
  debugPrint('starting AppWrite Services...');
  await Get.putAsync<AppWriteRepo>(() async => AppWriteRepo());
  debugPrint('All AppWrite services started');
}
