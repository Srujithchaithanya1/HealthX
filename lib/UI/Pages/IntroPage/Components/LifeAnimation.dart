import 'package:flutter/material.dart';
import 'package:healthx/Globals.dart';
import 'package:lottie/lottie.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
class LifeAnimation extends StatelessWidget
{
  double? age;
  LifeAnimation(double age)
  {
      this.age=age;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LiquidAnimation(age!);
  }
 
}

class LiquidAnimation extends StatefulWidget
{
  
  double? age;
  LiquidAnimation(double age)
  {
    this.age=age;
  }
  LiquidAnimationState createState()=>LiquidAnimationState(age!);
}

class LiquidAnimationState extends State<LiquidAnimation>
{

  


  double? age;
  LiquidAnimationState(double age)
  {
    this.age=100-age;
    // this.age=100-age;
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(image: NetworkImage("https://cdn2.iconfinder.com/data/icons/greenline/512/heartbeat-1024.png"))
      // ),
      child: Column(
        children: [
          SizedBox(
              height:250,
              width:250,
              child: Container(
              child : LiquidCircularProgressIndicator(
              value: age!/100, // Defaults to 0.5.
              valueColor: AlwaysStoppedAnimation(Globals.greenShade), // Defaults to the current Theme's accentColor.
              backgroundColor: Colors.white, // Defaults to the current Theme's backgroundColor.
              borderColor: Colors.black,
              borderWidth: 5.0,
              
              // direction: Axis.horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
              center: Column(
                children: [
                  Container(
                    height: 150,
                    child: Lottie.network(
                      // frameRate: FrameRate(10),
                      reverse: true,
  
                      // controller: Animation(20),
                      "https://assets5.lottiefiles.com/packages/lf20_vxuckou6.json"
                      // "https://assets10.lottiefiles.com/packages/lf20_0h0Njx.json"
                      )),
                  Text("$age"+"%\n  Life",style: TextStyle(fontSize: 30,color: Colors.black),),
                ],
              ),
            )
                // child: Text("etOKOK"),
                ),
          ),
          SizedBox(height: 20,),
          
          Stack(
            children: [
              
              SizedBox(
                height: 50,
                width: 300,
                child: LinearProgressIndicator(
                    value: 0.7,
                    color: Globals.greenShade,
                  
                    // color: Color.fromARGB(255, 255, 0, 0),
                    backgroundColor: Globals.blueShade,
                  
                    // semanticsLabel: 'Health',
                ),
              ),
              Text("  Health",style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic,fontWeight: FontWeight.w300),),
            ],
          )
        ],
      ),
    );
  }

}