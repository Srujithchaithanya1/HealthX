import 'Pages/HealthCard.dart';
import 'Pages/IntroPage/Home.dart';
import 'Pages/Parameters/Mood.dart';
import 'package:flutter/material.dart';
import 'package:healthx/UI/Pages/Sleep.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthx/Globals.dart';
class MyHomePage extends StatefulWidget{


   


  MyHomePage(this.notificationAppLaunchDetails,{Key? key, required this.title}) : super(key: key);
  
  final String title;
  static const String routeName = '/';
  final NotificationAppLaunchDetails? notificationAppLaunchDetails;
  bool get didNotificationLaunchApp =>
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}


class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex=0;
  List _screens=[IntroPage(),Mood(),HealthCard(),Sleep(),];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: Center(child: Text(widget.title,style: TextStyle(color: Color.fromARGB(255, 1, 44, 18),fontStyle: FontStyle.italic),)),
        // backgroundColor:Globals.isOn ?Globals.mainColor: Color.fromARGB(255, 162, 236, 212),
        backgroundColor: Globals.mainColor,
        // elevation: 50,
        // toolbarHeight: 170,
        
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.circular(30))),
      ),
        
        
        floatingActionButton: FloatingActionButton(
          
          onPressed:() {
          changeColor();
        }, child: !Globals.isOn?Icon(Icons.mood):Icon(Icons.sick),),
        
      
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Globals.isOn?Colors.amber:Colors.red,selectedFontSize: 15,
          // backgroundColor:Colors.red ,

          items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home,color: Colors.black,),
            backgroundColor:   Color.fromARGB(255, 162, 236, 212),
          ),
          BottomNavigationBarItem(
            label: "Mood",
            icon: Icon(Icons.mood,color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: Icon(Icons.medical_information,color: Colors.black,),
          ),
          BottomNavigationBarItem(
            label: "Relax",
            icon: Icon(Icons.airline_seat_recline_extra,color: Colors.black,),
            
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Icon(Icons.account_circle,color: Colors.black,),
            
          ),
        
        ],
        currentIndex: _currentIndex,
        onTap: _updateIndex,

        
        ),


         
      body: _screens[_currentIndex],

    );
  }
  void  changeColor()
  {
     setState(() {
      // Theme.of(context).primaryColor=Colors.amber;
            if(Globals.isOn){
              Globals.mainColor=Colors.red;
            }
            else{
              Globals.mainColor=Globals.blueShade;
            }
            Globals.isOn=!Globals.isOn;
          });
  }
}