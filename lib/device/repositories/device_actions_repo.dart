import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceActions extends GetxService {
  @override
  void onInit() async {
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        'resource://drawable/splash',
        [
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            ledColor: Colors.white,
            defaultColor: Colors.blueGrey,
            defaultRingtoneType: DefaultRingtoneType.Alarm,
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [NotificationChannelGroup(channelGroupkey: 'basic_channel_group', channelGroupName: 'Basic group')],
        debug: true);
    super.onInit();
  }
}
