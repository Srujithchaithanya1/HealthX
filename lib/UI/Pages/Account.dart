import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; 
import 'package:healthx/Globals.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
class Account extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return AccountPage();
  }
    
}

class AccountPage extends StatefulWidget
{

  AccountPageState createState()=>AccountPageState();
  

}
class AccountPageState extends State<AccountPage>
{
  File? image;
  UploadTask? uploadTask;
  String? message;

  Future uploadImage() async{
    String fileName = basename(image!.path);
    final ref = FirebaseStorage.instance.ref().child('files/$fileName');
    uploadTask=ref.putFile(image!);

  }




  Future pickImage() async{
      try{final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image==null) return;
      final imageTemporary = File(image.path);
      
      setState(() => this.image=imageTemporary);
      uploadImage();
      // notificationsPlugin.cancelAll();
      
      }

     on PlatformException catch(e)
    {
      print('Failed to pick image $e');
    }}



  


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            children: [
              SizedBox(height: 30,),
                    Container(
                      child: Stack(
                        children: [
                          ClipOval(child: image!=null?Image.file(image!,
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                          ):FlutterLogo(size: 230)),
              
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: IconButton(
                              // alignment: Alignment.bottomRight,
                              icon:Icon(Icons.camera_alt,size: 50),onPressed:(){
                                pickImage();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 20,),
                   
              Container(
                height: 350,
      
                decoration: 
      BoxDecoration(
                      color: Color.fromARGB(222, 5, 238, 168),
                      borderRadius:BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                
                  children: [
                    SizedBox(height: 30,),
                     Container(
                      child: Text('User name:     Srujith Chaithanya',style: TextStyle(fontSize: 20),),
                    ),
                    
                    SizedBox(height: 20,),
                    Container(
                      child: Text('Date of Birth:     18-04-2003',style: TextStyle(fontSize: 20),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Text('House:     Boduppal',style: TextStyle(fontSize: 20),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Text('College:  CVR College of Engineering',style: TextStyle(fontSize: 17),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Text('Blood Group:     A+',style: TextStyle(fontSize: 20),),
                    ),
                    SizedBox(height: 20,),
                    
                    Container(
                      child: Text('Age:     20',style: TextStyle(fontSize: 20),),
                    ),
                    
                    
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                      child: ElevatedButton(child: Text('SignOut'),
                      onPressed: signOut,),
                    ),
              Container(
                child: ElevatedButton(child:Text("Stop all"),
                onPressed:() {
                  cancelAllNotifs();
                },),
              )
              
            ],
          ),
        ),
      ),
    );
  }

  Future signOut()  async{
      await FirebaseAuth.instance.signOut();
  }
  cancelAllNotifs()
  {
    notificationsPlugin.cancelAll(); 
  }

}
