import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TabContainer extends StatelessWidget
{
  String TabName="";
  String ExpiryDate="";
  String Need ="";
  String TabCount="";
  String Dosage ="";
  TabContainer(String TabName,String ExpiryDate,String Need,TabCount, String Dosage)
  {
    this.TabName=TabName;
    this.ExpiryDate=ExpiryDate;
    this.Need=Need;
    this.TabCount=TabCount;
    this.Dosage=Dosage;
  }

  @override
  Widget build(BuildContext context)
  {
      return 
      Scaffold(
        appBar: AppBar(title: Center(child: Text('Tab Info',style: TextStyle(color: Color.fromARGB(255, 1, 44, 18),fontStyle: FontStyle.italic),
        )),
        backgroundColor: Color.fromARGB(255, 162, 236, 212),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom:Radius.circular(30))),
      ),

      



        body: Column(
        children: [
        SizedBox(height:70),
        Align(
          alignment: Alignment.center,child:Container(height:480,width: 290,
        decoration: const BoxDecoration(
          color: Color.fromARGB(222, 5, 238, 168),
          borderRadius:BorderRadius.vertical(bottom: Radius.circular(40),top: Radius.circular(40)) ),
          child: Column(
            children: [
              Lottie.network('https://assets1.lottiefiles.com/packages/lf20_rngukoer.json'),
              Text('$TabName',style: const TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.white,
                    offset: Offset(1.0, 5.0),
                  ),
                  Shadow(
                    blurRadius: 12.0,
                    color: Colors.cyan,
                    offset: Offset(2.0, 6.0),
                  ),
                ],
                fontSize: 30,
              ),),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Table(
                  
                  children: [
                      TableRow(
                        children: [
                          Text("Expiry Date",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                          Text("$ExpiryDate",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                         
                          
                        ]
                        
                      ),

                      TableRow(
                        children: [
                          Text("Usage",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                          Text("$Need",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                          
                        ]
                        
                      ),
                      
                       TableRow(
                        children: [
                          Text("Dosage",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                          Text("$Dosage",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black),),
                          
                        ]
                        
                      ),
                      
                      
                      ]
                ),
              ),
            ],
          ),
        ),),
        SizedBox(height: 55,),
        Container(
          height: 60,
          width: 1000,
          
          decoration: const BoxDecoration(
          
          color: Color.fromARGB(255, 162, 236, 212),
          borderRadius:BorderRadius.vertical(bottom: Radius.circular(10),top: Radius.circular(40)) ),
          child: Center(
            child: Text('Tab Count :  ${TabCount.toString()}',style: TextStyle(color: Color.fromARGB(255, 1, 44, 18),fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.bold),
                ),
          )),
        
        ],
        ),
      );
  }
}