// void scheduleNotification() async {
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'channel_id',
//     'channel_name',
//     'channel_description',
//   );
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );

//   await flutterLocalNotificationsPlugin.schedule(
//     0,
//     'Scheduled Notification Title',
//     'Scheduled Notification Body',
//     scheduledNotificationDateTime, // 通知を表示する日時を指定
//     platformChannelSpecifics,
//   );
// }
