import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void init() async {
    // Initialize native android notification
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // Initialize native Ios Notifications
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (res) {
        Fluttertoast.showToast(msg: "${res.payload}");
      },
    );
  }

  simpleNotification() async {
    var andorid = const AndroidNotificationDetails(
      'id',
      'chat notification',
      priority: Priority.high,
      importance: Importance.max,
    );

    var iOs = const DarwinNotificationDetails();
    var platform = NotificationDetails(android: andorid, iOS: iOs);
    await flutterLocalNotificationsPlugin.show(
        0, 'chat app ', 'notification is working ', platform,
        payload: 'hey there welcome to our chat app ');
  }
}
