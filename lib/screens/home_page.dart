import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  final NotificationService _notificationService =
      NotificationService(); // NotificationServiceのインスタンス

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _pickDateTime(),
          child: const Text('通知する時間を設定してください。'),
        ),
      ),
    );
  }

  void _pickDateTime() {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2100),
      onConfirm: (date) {
        setState(() {
          selectedDate = date;
        });
        // NotificationServiceを使用して通知をスケジュール
        _notificationService.scheduleNotification(selectedDate);
      },
      currentTime: DateTime.now(),
    );
  }
}
