import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:healthx/config.dart';
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

class Weather extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    
    return WeatherApp();
  }

}


class WeatherApp extends StatefulWidget {
  @override
  WeatherAppState createState() => WeatherAppState();
}
Map<String,dynamic>? _data;
  String? _error;

Map<String,dynamic> d={};
class WeatherAppState extends State<WeatherApp> {
  
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    
    Position position = await Geolocator.getCurrentPosition();
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$api_key'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        _data = data;
        d=data;
      });
    } else {
      setState(() {
        _error = 'Error fetching data';
      });
    }
  }

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: _data != null
            ? ClipRRect(
              child: Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  
                  image:DecorationImage(
                  alignment: Alignment.bottomRight,
                  image:_data!['weather'][0]['description'].toString()!='rainy'? NetworkImage('https://cdn3.iconfinder.com/data/icons/cosmo-color-weather/40/day_lot_clouds-512.png'):
                  NetworkImage('https://cdn3.iconfinder.com/data/icons/cosmo-color-weather/40/day_rain-1024.png')
                  
                  
                  ),
                  color:Color.fromARGB(222, 5, 238, 168),
                  borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)),
                
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Text(_data!['name'].toString(),style: TextStyle(fontSize: 35),),
                      SizedBox(height: 5,),
                      Text('Temperature:'+_data!['main']['temp'].toString(),style: TextStyle(fontSize: 18)),
                      Text('Humidity:'+_data!['main']['humidity'].toString(),style: TextStyle(fontSize: 15)),
                      Text('Pressure:'+_data!['main']['pressure'].toString(),style: TextStyle(fontSize: 15)),
                      Text(_data!['weather'][0]['description'].toString(),style: TextStyle(fontSize: 15)),
                      
                    ],
                  ),
                ),
              ),
            )
            : _error != null
                ? Text(_error!)
                : CircularProgressIndicator(),

      ),
    );
  }
  String getTemperature()
  {
      return _data!['main']['temp'].toString();
  }
  String getHumidity()
  {
    return d['main']['humidity'].toString();
  }
  String getPressure()
  {
      return _data!['main']['pressure'].toString();
  }
  String getDescription()
  {
    return d['weather'][0]['description'].toString();
  }

  
 
}
