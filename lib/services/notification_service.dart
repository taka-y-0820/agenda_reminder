import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService() {
    _initialize();
  }

  void _initialize() {
    tz.initializeTimeZones();
    const androidInitializationSettings =
        AndroidInitializationSettings('app_icon');
    final initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    _localNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleNotification(DateTime scheduledTime) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const platformDetails = NotificationDetails(android: androidDetails);

    tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);

    await _localNotificationsPlugin.zonedSchedule(
      0,
      'Scheduled Notification',
      'This is the content of the notification.',
      tzScheduledTime,
      platformDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}
