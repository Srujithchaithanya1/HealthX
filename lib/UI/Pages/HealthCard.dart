import 'package:cloud_firestore/cloud_firestore.dart';
import 'Parameters/Components/Activities.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'Parameters/Components/Food.dart';
import 'package:healthx/Globals.dart';

class HealthCard extends StatelessWidget{

  InputTagsState inputTagsState = InputTagsState();
  List<String> foodTags = InputTagsState.getFood();
  IconsGridState iconsGridState = IconsGridState();
  List<String> activity_icons = IconsGridState.getActivites();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height:40),
          const Text("Your Health History ",style: TextStyle(fontSize: 30),),
          // SizedBox(height:2),
          StreamBuilder<QuerySnapshot>(
                     stream: FirebaseFirestore.instance
                        .collection('Health')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('TodaysHealth')
                        .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot) {
                        if(!snapshot.hasData)
                        {
                            return CircularProgressIndicator();
                        }
    
                        return ListView.builder(
                          shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context,int index){
                            final document = snapshot.data!.docs[index];
                            final desc = document["Description"];
                            final temp = document["Temperature"];
                            final healthy = document["isHealthy"];
                            final date = document["date"];
                            final time = document["time"];
                            return Column(
                              children: [
                                SizedBox(height: 20,),
                                Container(
                      decoration: BoxDecoration(
                      color: healthy?Globals.greenShade:Colors.red,
                      borderRadius:const BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(20)) ),
                      // color: Color.fromARGB(190, 213, 7, 55),
                      height: 200,
                      width: 350,
                      child: Column(
                        children: [
                          healthy ?const Text('Healthy ❤️‍🩹',style: TextStyle(fontSize: 30),):
                          const Text('Sick 🤧',style: TextStyle(fontSize: 30),),
                          const SizedBox(height: 30,),
                          Text(date,style: const TextStyle(fontSize: 25),),
                          const SizedBox(height: 10,),
                          Text(time),
                          
                            ],
                          )
                      
                        ),
                       ],
                    );
                 }
              );
    
           }),
        ],
      ),
    );
  }

}



