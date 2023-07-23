// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthx/Notifications/TabNotification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Registration extends StatefulWidget{
   State<Registration> createState()=> RegistrationState();
}


class RegistrationState extends State<Registration>
{
  int _selectedValue = 0;
  final _textController = TextEditingController();  //daily or custom value
  final Tab_controller = TextEditingController();
  final Exp_controller = TextEditingController();
  final Need_controller = TextEditingController();
  final TabCount_controller = TextEditingController();
  final Dosage_controller = TextEditingController();
  bool flag = true; // for daily or custom 
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Tablet Registration')),
    body: 
    
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 300,
            child: Column(
              children: [
                const SizedBox(height: 20,),
    
                TextField(
                
                  controller: Tab_controller,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),labelText:'TabletName'),),
    
    
                const SizedBox(height: 20,),
    
    
                TextField(
                  controller: Exp_controller,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),labelText:'ExpiryDate'),),
                  const SizedBox(height: 20,),
    
    
                TextField(
                  controller: Need_controller,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),labelText:'Need'),),
                  const SizedBox(height: 20,),
                TextField(
                  controller: TabCount_controller,
                  // keyboardType: ,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),labelText:'TabCount'),),
                  const SizedBox(height: 20,),
    
                TextField(
                  controller: Dosage_controller,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                  border: OutlineInputBorder(),labelText:'How many Times A Day'),),
                  const SizedBox(height: 20,),
    
    
                
                  
                DropdownButton<int>(
                value: _selectedValue,
                items: const [
                  DropdownMenuItem(
                    value: 0,
                    child: Text('Custom (No.of Days)'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Daily'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value!;
                    if (value == 1) {
                      _textController.text = 'Daily';
                      flag=true;
                    } else {
                      flag=false;
                      _textController.clear();
                    }
                  });
                },
              ),
              TextField(
                readOnly: flag,
                controller: _textController,
                keyboardType: (_selectedValue == 0)
                    ? TextInputType.number
                    : TextInputType.text,
                onChanged: (value) {
                  if (_selectedValue == 0) {
                    }
                },
              ),
    
              ],
            ),
          ),
          Center(
            child: FloatingActionButton(
                onPressed:() {
                    final name=Tab_controller.text;
                    final date=Exp_controller.text;
                    final need=Need_controller.text;
                    final TabCount=TabCount_controller.text;
                    final Dosage = Dosage_controller.text;
                    _newTablet(Tname:name,Edate:date,Need:need,TabCount:TabCount,Dosage: Dosage);
                    if(Dosage=="1")
                    {
                      TabNotification.alarm1(name,20,0,flag);
                    }
                    if(Dosage=="2")
                    {
                      TabNotification.alarm1(name,20,0,flag);
                      TabNotification.alarm1(name,13,0,flag);
                    }
                    if(Dosage=="3")
                    {
                      TabNotification.alarm1(name,20,0,flag);
                      TabNotification.alarm1(name,9,0,flag);
                      TabNotification.alarm1(name,13,0,flag);
                    }
                    Tab_controller.clear();
                    Exp_controller.clear();
                    Need_controller.clear();
                    TabCount_controller.clear();
                    Dosage_controller.clear();
                    
                },
                tooltip: 'Increment',
                child:  const Icon(Icons.add),
              ),
          ),
          
          
    
        ],
      ),
    )
    );
    
    

  }

  Future _newTablet({required String Tname, required String Edate,required String Need,required TabCount,required Dosage})async
  {
      
      final user_id = FirebaseAuth.instance.currentUser!.uid;
      final details = FirebaseFirestore.instance.collection('Tablets').doc(user_id).collection('TabDetails').doc();
      final json= 
      {
          
          'TabletName': Tname,
          'ExpiryDate': Edate,
          'Need': Need,
          'id':details.id,
          'TabCount':TabCount,
          'Dosage':Dosage,
          
      };
      
      await details.set(json);
      
  }
  
}


