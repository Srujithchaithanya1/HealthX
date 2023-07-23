import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:lottie/lottie.dart';
import 'package:healthx/Globals.dart';
import 'dart:async';
class Sleep extends StatelessWidget
{
  Widget build(BuidContext)
  {
    return Rest();
  }
}
class Rest extends StatefulWidget
{
  RestState createState()=> RestState();
}
class RestState extends State<Rest>
{
  int time_left = 40;
  void startTimer()
  {
    Timer.periodic(Duration(seconds:1), (timer) { 
      setState(() {
        time_left=time_left-10;
        if(time_left==0)
        {
          time_left=100;
          timer.cancel();
        }
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30,),
          SizedBox(
            height: 300,
            width: 250,
    
            child: Stack(
              children: [
                Lottie.network('https://assets9.lottiefiles.com/packages/lf20_uomCWjKFFp.json'),
                Text("\n\t\t\t\tTotal Sleep",style: TextStyle(fontSize: 26,fontStyle: FontStyle.italic,color: Color.fromARGB(203, 58, 3, 255),fontWeight: FontWeight.bold),),
          
                
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(146, 8, 231, 164),
                      borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
    
                  child:Center(
                    
                    child: Align(
                      alignment:Alignment.bottomCenter,
                      child: Text("7 hrs\n",style: TextStyle(fontSize: 40,fontStyle: FontStyle.italic,color: Colors.black),))),
                                // color: Globals.greenShade,
                ),
              ],
            )
            // CircularProgressIndicator(
            //   strokeWidth: 30,
            //   value: 0.3,
              
            // ),
          ),
          SizedBox(height: 30,),
          
          // Container(
          //     margin: const EdgeInsets.all(25),
          //     child: TextButton(
          //       child: const Text(
          //         'Show alarms',
          //         style: TextStyle(fontSize: 20.0),
          //       ),
          //       onPressed: () {
          //         FlutterAlarmClock.showAlarms();
                            
          //       },
          //     ),
          //   ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create timer for 42 seconds',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  FlutterAlarmClock.createTimer(length:2);
                  
                },
              ),
            ),
          
          SizedBox(
            height: 400,
            width: 300,
            child: 
            Container(
              decoration: BoxDecoration(
                color: Globals.greenShade,
                borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
              child: Column(
                
                children: [
                  SizedBox(height: 40,),
                  Text('Power Nap⚡',style: TextStyle(fontSize: 30),),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 40,),
                      Container(child:ElevatedButton(child: Text("10 min"),onPressed: (){},)),
                      SizedBox(width: 40,),
                      Container(child:ElevatedButton(child: Text("15 min"),onPressed: (){},)),
                      
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 40,),
                      Container(child:ElevatedButton(child: Text("20 min"),onPressed: (){},)),
                      SizedBox(width: 40,),
                      Container(child:ElevatedButton(child: Text("30 min"),onPressed: (){},)),
                      
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 40,),
                      Container(child:ElevatedButton(child: Text("1 hr"),onPressed: (){},)),
                      SizedBox(width: 40,),
                      Container(child:ElevatedButton(child: Text("1 hr 30 min"),onPressed: (){},)),
                      
                    ],
                  ),
                ],
              ),
    
         ),
          ),
          SizedBox(height: 20,),
          Container(
            // color: Globals.greenShade,
            width: 300,
            height: 60,
            decoration: BoxDecoration(
                color: Color.fromARGB(222, 5, 238, 168),
                borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
            child: Row(
              children: [
                SizedBox(width: 40,),
                Text("See All Alarms      ",style: TextStyle(fontSize: 20),),
                FloatingActionButton(
                  child:Icon(Icons.alarm),
                  onPressed: () {
                  FlutterAlarmClock.createAlarm(hour:1,minutes: 20);
                  
                  
                },),
                
            
              ],
            ),
          ),
          SizedBox(height: 100,),
          Stack(
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Text("\n\n\n$time_left sec",textAlign: TextAlign.center,style: TextStyle(fontSize: 30),)),
              SizedBox(height: 300,width: 300,
                child:
                
                time_left!=100?Lottie.network("https://assets9.lottiefiles.com/temp/lf20_K46qfq.json"):
                SizedBox(
                  child: Image.network(cacheHeight: 200,cacheWidth: 200,"https://cdn3.iconfinder.com/data/icons/mental-health-and-disorder-flat/128/Therapy_treatment_mental_health_healthcare_Meditation_healthy-1024.png"),
                ),
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: CircularProgressIndicator(
                  value: time_left/100,
                  strokeWidth: 30,
                  backgroundColor: Globals.greenShade,
                  color: Globals.blueShade,
                ),
              ),
            ],
          ),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: startTimer, child: Text('start'))

        ],
      ),
    ));
  }

}