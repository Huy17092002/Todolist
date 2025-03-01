import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  NotificationService();
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static final BehaviorSubject<String> behaviorSubject = BehaviorSubject();

  static Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(
      tz.getLocation(await FlutterTimezone.getLocalTimezone()),
    );
  }

  static Future<NotificationDetails> _notificationDetails(
      bool isPlaySound) async {
    AndroidNotificationDetails androidPlatform = AndroidNotificationDetails(
      'channel id',
      'channel name',
      groupKey: 'dd',
      channelDescription: 'des',
      importance: Importance.max,
      priority: Priority.max,
      playSound: isPlaySound,
    );

    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatform,
    );
    return platformChannelSpecifics;
  }

  static Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
    required bool isPlaySound,
  }) async {
    final platformChannelSpecifics = await _notificationDetails(isPlaySound);
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  static Future<void> setScheduleNotification({
    required DateTime scheduleDateTime,
    required String title,
    required String body,
    required int id,
    required bool isPlaySound,
  }) async {
    final platformChannelSpecifics = await _notificationDetails(isPlaySound);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime(
        tz.local,
        scheduleDateTime.year,
        scheduleDateTime.month,
        scheduleDateTime.day,
      ),
      platformChannelSpecifics,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  static Future<void> setPeriodicNotification({
    required int id,
    required String title,
    required String body,
    required bool isPlaySound,
    required int daysInterval,
  }) async {
    final platformChannelSpecifics = await _notificationDetails(isPlaySound);

    DateTime now = DateTime.now();
    DateTime firstScheduleDate = now.add(Duration(days: daysInterval));

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(firstScheduleDate,tz.local),
      platformChannelSpecifics,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }
}
