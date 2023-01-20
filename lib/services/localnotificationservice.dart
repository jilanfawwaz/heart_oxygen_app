import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//! Local Notification 13.2 : import package timezon
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

//! Local Notification 1 : tambahkan package flutter_local_notifications dan timezone
//! Local Notification 2 : lakukan konfigurasi ios di AppDelegate.swift dan konfigurasi android di build.gradle (lihat di pubdev)

//! Local Notification 3 : buat class notification service
class LocalNotificationService {
  //! Local Notification 4 : instansiasi object LocalNotification
  LocalNotificationService();
  final FlutterLocalNotificationsPlugin _localNotificationService =
      FlutterLocalNotificationsPlugin();

  //! Local Notification 14.2 :
  StreamController<String> onNotificationClick = StreamController<String>();

  //! Local Notification 5 : bikin fungsi init notification
  Future<void> initialize() async {
    //! Local Notification 13.3 : inisialisasi package timezone
    tz.initializeTimeZones();

    //! Local Notification 6.1 : konfigurasi icon untuk android (pastikan sudah memasukkan icon ke folder res di android, dan samakan nama file nya dibawah)
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@drawable/ic_launcher');

    //! Local Notification 6.2 : konfigurasi untuk ios
    DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    //! Local Notification 7 : masukkan konfigurasi ios dan android diatas ke object InitializationSettings
    final InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    //! Local Notification 8 : masukkan setting dari (7), dan bikin method onDidReceivedNotificationResponse (versi lama namanya onSelectNotification)
    await _localNotificationService.initialize(settings,
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse);
  }

  //! Local Notification 9 : bikin NotificationDetails masing2 untuk android dan ios, kemudian return
  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_Id',
      'channel_Name',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      enableVibration: true,
    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
  }

  //! Local Notification 10 : bikin method showNotification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(
      id,
      title,
      body,
      details,
    );
  }

  //! Local Notification 13.1 : bikin method untuk notifikasi dengan timer
  Future<void> showNotificationTimer({
    required int id,
    required String title,
    required String body,
    required int second,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        DateTime.now().add(Duration(seconds: second)),
        tz.local,
      ),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //! Local Notification 14.1 : bikin method notifikasi dengan payload
  //? payload adalah pesan yang ingin diinject kedalam aplikasi ketika menekan notifikasi
  Future<void> showNotificationPayload({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(
      id,
      title,
      body,
      details,
      payload: payload,
    );
  }

  //! Local Notification 6.2 : konfigurasi untuk ios
  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
    print('apaan nih');
  }

  //! Local Notification 8 : masukkan setting dari (7), dan bikin method onDidReceivedNotificationResponse
  void _onDidReceiveNotificationResponse(NotificationResponse details) {
    print(details.payload);

    //! Local Notification 14.3 :
    if (details.payload != null && details.payload!.isNotEmpty) {
      onNotificationClick.sink.add(details.payload!);
      print('masuk');
    }
  }
}
