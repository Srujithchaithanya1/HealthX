import 'dart:typed_data';
import 'dart:async';
import 'package:healthx/Globals.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class TabNotification
{
  static Future <void> alarm1(String TabName,int hour,int minute,bool flag) async {
  const int insistentFlag = 4;
  AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    "chammelID",
    "channelName",
    priority: Priority.max,
    importance: Importance.max,
    
    
    additionalFlags: Int32List.fromList(<int>[insistentFlag]),
    actions:<AndroidNotificationAction>[
      AndroidNotificationAction('0', 'Show',
        cancelNotification: true,
        showsUserInterface: true,
      
      ),
      AndroidNotificationAction('1', 'later',
      
      ),
    ],
  );

  NotificationDetails notiDetails = NotificationDetails(
    android: androidDetails,
  );

  // Get the date and time 10 seconds from now
  // var scheduledNotificationDateTime = DateTime.now().add(Duration(seconds: 10));
  var scheduledNotificationDateTime = new DateTime(DateTime.now().year,DateTime.now().month, DateTime.now().day, hour, minute, 0);
  // Schedule the notification
  if(DateTime.now().hour>hour && DateTime.now().hour>minute){
    scheduledNotificationDateTime = scheduledNotificationDateTime.add(Duration(days: 1));
  }
  
  await notificationsPlugin.periodicallyShow(
    1,
    TabName,
    "",
    RepeatInterval.everyMinute,
    notiDetails,
    payload: 'DestinationScreen',
  );
}
}