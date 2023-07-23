import 'package:healthx/UI/FirstScreen.dart';
import 'package:flutter/material.dart';
import 'Globals.dart';
import 'package:healthx/UI/HomePageNavgation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'package:healthx/Notifications/ReceivedNotification.dart';
// import 'CameraPage.dart';


const navigationActionId = 'id_3';
List<String> _tags = [];

FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();


final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

String? selectedNotificationPayload; 

void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}
// String initialRoute = '/';
 NotificationAppLaunchDetails? notificationAppLaunchDetails;
 String ?initialRoute;
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  AndroidInitializationSettings androidSettings = AndroidInitializationSettings("@mipmap/ic_launcher");
  InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
    
  );
  await notificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          if (notificationResponse.actionId == navigationActionId) {
            selectNotificationStream.add(notificationResponse.payload);
          }
          break;
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    
  );

  notificationAppLaunchDetails = await notificationsPlugin.getNotificationAppLaunchDetails();
  initialRoute = MyHomePage.routeName;
  // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
  //   selectedNotificationPayload =
  //       notificationAppLaunchDetails!.notificationResponse?.payload;
  //   initialRoute = SecondPage.routeName;
  // }
  

  runApp(FirstPage());
}



class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return 
      
       MaterialApp(
        color: Globals.mainColor,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,

        
        ),
        initialRoute:initialRoute,
        routes: <String,WidgetBuilder>{
          // MyHomePage.routeName:(_) => Navigate(),

          MyHomePage.routeName:(_) => MyHomePage(notificationAppLaunchDetails, title: 'HealthX',),
          // SecondPage.routeName: (_) => SecondPage(selectedNotificationPayload)
        },
        // home: MyHomePage(title: 'Easy Tablet'),
        // home:Navigate()
      
    );
  }
  
}

