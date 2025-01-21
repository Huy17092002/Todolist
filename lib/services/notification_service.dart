import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:todolist/model/task.dart';
import 'package:todolist/model/tasklist.dart';

class NotificationService {
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  static Future<void> initNotification() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    tz.initializeTimeZones();
    tz.setLocalLocation(
      tz.getLocation(await FlutterTimezone.getLocalTimezone()),
    );
  }

static Future<void> scheduleNotificationForTask(Task task, TaskList taskList) async {
    if (task.reminderTime != null) {
      tz.TZDateTime scheduledTime = tz.TZDateTime.from(task.reminderTime!, tz.local);

      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );
      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        task.id,
        "Lời nhắc",
        task.title,
        scheduledTime,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.wallClockTime,
        matchDateTimeComponents: DateTimeComponents.time,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
      );
    }
  }
}