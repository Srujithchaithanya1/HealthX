import 'Components/Food.dart';
import 'Components/Activities.dart';
import 'Components/Weather.dart';
import 'package:healthx/DataBase/HealthFactors.dart';
import 'package:flutter/material.dart';
import 'package:healthx/Globals.dart';
class Mood extends StatelessWidget
{
  // final food = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MoodSelect();
  }

}



class MoodSelect extends StatefulWidget{
  @override
  MoodSelectState createState()=>MoodSelectState();

}

class MoodSelectState extends State<MoodSelect>{

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Text('Weather',style: TextStyle(fontSize: 30,)),
                        
                        Container(
                          
                          child: Weather(),
                          height: 210, 
                          width: 360,
                        
                        ),
                        SizedBox(height: 40,),
                        Text('Food',style: TextStyle(fontSize: 30,)),
                       
                        Container(
                        height: 210, 
                        width: 320,
                        decoration: const BoxDecoration(
                          // color: Colors.red,
                          // color: Color.fromARGB(222, 5, 238, 168),
                          borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
                        child: Center(
                          child: SizedBox(
                            // height: 90,
                            // width: 270,
                            child: Food()
                          ),
                        ),
                        ),
                        const SizedBox(height: 40,),
                  
                  
                        // ACTIVITIES
                  
                        const Text('Activities',style: TextStyle(fontSize: 30,)),
                        Container(height: 300,width: 340,
                        decoration: const BoxDecoration(
                          // color: Color.fromARGB(222, 5, 238, 168),
                          borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
                        child: Center(
                          child: SizedBox(child:GridShow() ),
                        )
                        ),
                    
                        const SizedBox(height:40),
                        FloatingActionButton(onPressed: (){
                          sendDataToFireBase();
                          // SnackBar(content: "content");
                          setState(() {
                            Food.clearAll();
                            GridShow.clearAll();
                          });
                          
                          // Weather.clearAll();
                          ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color.fromARGB(255, 85, 255, 90),
                            content: Center(child: Text('Done For Today :)',style: TextStyle(color: Colors.black),)),
                            duration: Duration(seconds: 3),
                            ),
                          );

                        },child: Icon(Icons.check)),
                        const SizedBox(height:40),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
  Future<void> sendDataToFireBase ()
  async {

     WeatherAppState todayWeatherState = new WeatherAppState();
  InputTagsState inputTagsState = InputTagsState();

  List<String> foodTags = InputTagsState.getFood();
  IconsGridState iconsGridState = IconsGridState();
  List<String> activity_icons = IconsGridState.getActivites();
    
    HealthFactors todaysHealth = HealthFactors(todayWeatherState.getTemperature(),
    todayWeatherState.getHumidity(),todayWeatherState.getPressure(),todayWeatherState.getDescription(),foodTags,activity_icons,Globals.isOn);
    todaysHealth.sendData();
                             
  }
  
}
