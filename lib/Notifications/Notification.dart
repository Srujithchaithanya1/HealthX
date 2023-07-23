import 'dart:typed_data';
import 'dart:async';
import 'TabNotification.dart';
import 'package:healthx/Globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications extends StatefulWidget
{
  String TabName="";
  int hour=-1;
  int minute =-1;
  Notifications(String TabName,int hour,int minute){
    this.TabName=TabName;
    this.hour = hour;
    this.minute-minute;
  }
  
  @override
  State<Notifications> createState()=> _NotificationsState(TabName);
  
  }
  
  class _NotificationsState extends State<Notifications>{
    String TabName="";
  _NotificationsState(String TabName){
    this.TabName=TabName;
  }
  
    
  
    void cancelAlarm()
    {
      notificationsPlugin.cancelAll();
    }
    


  static Future <void> alarm1(String TabName,int hour,int minute) async {
  const int insistentFlag = 4;
  AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    "chammelID",
    "channelName",
    priority: Priority.max,
    importance: Importance.max,
    // ongoing: true,
    
    additionalFlags: Int32List.fromList(<int>[insistentFlag]),
    actions:<AndroidNotificationAction>[
      AndroidNotificationAction('0', 'open Cam',
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



  // ..................NOT WORKING AS IT IS DEPRECATED..................
  
  
  
  // await notificationsPlugin.schedule(
  //   0,
  //   TabName,
  //   "",
  //   scheduledNotificationDateTime,
  //   notiDetails,
  //   payload: 'DestinationScreen',
  // );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 300,),
          Center(
            child: TextButton(child: Text("Alarm"),
            onPressed: () async{
              // await alarm1(TabName,12,50);
              // await alarmSchedule(TabName,DateTime.now().add(Duration(seconds: 10)));
              await TabNotification.alarm1(TabName, 15, 14, true);
            }
            ),

          
            
          ),
        
            TextButton(child: Text("Stop"),
            onPressed: cancelAlarm,
            ),
            TextButton(child: Text("Stop"),
            onPressed: cancelAlarm,
            ),

            
        ],
      ),
    );
  }

  }
  
  
  