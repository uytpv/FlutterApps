import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';
import 'dart:io';

class AlarmScreen extends StatefulWidget {
  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> _onSelectNotification(String? payload) async {
    print('Người dùng đã chọn thông báo: $payload');
    // Xử lý hành động của người dùng khi thông báo được chọn (ví dụ: tắt báo thức)
  }

  @override
  void initState() {
    super.initState();
    initializeNotifications();
    _scheduleAlarms();
  }

  Future<void> initializeNotifications() async {
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: _onSelectNotification,
    );
  }

  void _scheduleAlarms() {
    _scheduleAlarm("Alarm 1", 6, 55);
    _scheduleAlarm("Alarm 2", 12, 55);
    _scheduleAlarm("Alarm 3", 18, 55);
    _scheduleAlarm("Alarm 4", 24, 55);
  }

  Future<void> _scheduleAlarm(String alarmId, int hour, int minute) async {
    var time = tz.TZDateTime.now(tz.local).add(Duration(hours: hour, minutes: minute));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      alarmId,
      'Thông báo báo thức',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      enableLights: true,
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: null, iOS: null);


    if (Platform.isAndroid) {
      platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    } else if (Platform.isIOS) {
      var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'your_custom_sound.aiff', // Thay 'your_custom_sound.aiff' bằng đường dẫn đến tệp âm thanh tùy chỉnh của bạn
      );
      platformChannelSpecifics = NotificationDetails(iOS: iOSPlatformChannelSpecifics);
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Báo thức',
      'Thời gian báo thức đã đến',
      time,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ứng dụng báo thức'),
      ),
      body: Center(
        child: Text(
          'Ứng dụng đang chạy báo thức liên tục hàng ngày.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
