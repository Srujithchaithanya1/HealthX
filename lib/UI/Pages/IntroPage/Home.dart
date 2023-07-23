
import 'package:healthx/UI/Pages/IntroPage/Components/TabCard.dart';
import 'package:healthx/DataBase/TabRegistration.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Components/TabInfo.dart';
import 'Components/LifeAnimation.dart';
// import "Registration.dart";
TabCard g = TabCard();

TabContainer t = new TabContainer("","","",0,"");
class IntroPage extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  
    return  SingleChildScrollView(
        
        child: Column(
          children: [
            SizedBox(height:35),
            Align(alignment: Alignment.topLeft,child:Container(height:210,width: 290,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomRight,
                image: NetworkImage('https://cdn3.iconfinder.com/data/icons/cannabidiol-1/512/CBD-cannabidiol-cannabis-marijuana-glyph-06-512.png')),
              color: Color.fromARGB(222, 5, 238, 168),
              borderRadius:BorderRadius.vertical(bottom: Radius.circular(40),top: Radius.circular(10)) ),
              child: Text("\nWelcome,\nSrujith...",style: TextStyle(fontSize: 30),),
            ),),
            Container(
              // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://cdn.wallpapersafari.com/90/62/U3pPQk.jpg'),
              // fit: BoxFit.fill)),
              child: Center(
                child: Column(
                  children: [
                  //  ElevatedButton(onPressed: signOut, child: Text('SignOut')), 
                SizedBox(height: 20,),
                
                  Container(
                    // height: 200,
                    // width: 200,
                    child:LifeAnimation(30),),
                const SizedBox(height: 20,),
                const  Text("Your active Medicines",
                style: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 183, 211, 113),
                      offset: Offset(1.0, 5.0),
                    ),
                    Shadow(
                      blurRadius: 12.0,
                      color: Color.fromARGB(255, 216, 156, 219),
                      offset: Offset(2.0, 6.0),
                    ),
                  ],
                  fontSize: 28,
                ),
              ),
                    
              // const SizedBox(height:5),      

              
              
              
              // Big Box of Records

              Container(
                alignment: Alignment.center,
                // color: Color.fromARGB(255, 218, 188, 212),
    //       decoration: const BoxDecoration(
		// 	gradient: LinearGradient(
		// 	colors: [Colors.purple, Colors.blue],
		// 	begin: Alignment.bottomLeft,
		// 	end: Alignment.topRight,
		// ),
		// ),
                // height: 450,
                // width: 300,
                child: g.build(context),
                ),
              // t.build(context),
                  // g.build(context),

                const SizedBox(height:30),
              // g.build(context),
              

                // New Tablet Insertion
                Container(
                  height: 60,
                  child: ElevatedButton(
                  child: Text('Register New Tablet'),
                  onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Registration()));
                  }),
                  ),
                  const SizedBox(height:30),
                  
                  // Container(
                  //   height: 60,
                  // child: ElevatedButton(
                  // child: Text('AlarmNoti'),
                  // onPressed:(){
                    
                  //   Navigator.push(context,MaterialPageRoute(builder: (context)=>Notifications("Demo",DateTime.now().hour,DateTime.now().minute)));
                  // }),
                  // ),

                  // Container(
                  //   height: 60,
                  // child: ElevatedButton(
                  // child: Text('Pusher'),
                  // onPressed:(){
                  //   FireBase_User u = new FireBase_User();
                  //   // u.Login("email", password)
                  //   // u.SignUp("wey7bemail@gmail.com", "tty6ivtft8");
                  //   // u.dataBase("u.user_Email.toString()");
                  //   // Navigator.push(context,MaterialPageRoute(builder: (context)=>Notifications("Demo",DateTime.now().hour,DateTime.now().minute)));
                  // }),
                  // ),


                  // Container(
                  // height: 60,
                  // child: ElevatedButton(
                  // child: Text('Cam'),
                  // onPressed:(){
                  //   Navigator.push(context,MaterialPageRoute(builder: (context)=>CamAlarm()));
                  // }),
                  // ),


                  
                  // Container(
                  // height: 60,
                  // child: ElevatedButton(
                  // child: Text('Alarm'),
                  // onPressed:(){
                  //   Navigator.push(context,MaterialPageRoute(builder: (context)=>Alarm()));
                  // }),
                  
                  // ),
                  ElevatedButton(onPressed: signOut, child: Text("SignOut"))
                  
    ],

                ),
              ),
            ),
          ],
        ),
      );
  }

Future signOut()  async{
      await FirebaseAuth.instance.signOut();
  }


}