import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HealthFactors
{
  String ?temperature;
  String ?pressure;
  String ?humidity;
  String ?description;
  List<String> ?food;
  List<String> ?activites;
  bool ? isHealthy;
  HealthFactors(String temperature,String humidity,String pressure,String description,List<String> food,List<String> activites,bool isHealthy)
  // HealthFactors(int temperature,int pressure,int humidity,String description,List<String> food,List<String> Activities)
  {
      this.temperature=temperature;
      this.description=description;
      this.humidity=humidity;
      this.pressure=pressure;
      this.activites=activites;
      this.food=food;
      this.isHealthy=isHealthy;
  } 

  Future sendData() async {
      // final user_id = FirebaseAuth.instance.currentUser!.uid;
      final details = FirebaseFirestore.instance.collection('Health').doc(FirebaseAuth.instance.currentUser!.uid).collection('TodaysHealth').doc();
      final json= 
      {
        
          'id':details.id,
          'Temperature': temperature,
          'Pressure': pressure,
          'Humidity': humidity,
          'Description': description,
          'activities':activites,
          'food': food,
          'isHealthy': isHealthy,
          'date': DateTime.now().toString().substring(0,10),
          'time': DateTime.now().toString().substring(10,18)
          
      };
      
      await details.set(json);

  }


}