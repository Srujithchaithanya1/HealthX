// import 'dart:html';

import 'package:healthx/DataBase/Firebase_User.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';
import 'TabInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabCard extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance
    .collection('Tablets')
    .doc(FirebaseAuth.instance.currentUser!.uid)
    .collection('TabDetails')
    .snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (BuildContext context, int index) {
        final document = snapshot.data!.docs[index];
        final tabletName = document['TabletName'];
        return Column(
          children: [
            SizedBox(height: 20,),
            Container(
  decoration: BoxDecoration(
    image:DecorationImage(
      alignment: Alignment.bottomLeft,
      image: NetworkImage("https://cdn2.iconfinder.com/data/icons/medical-2285/24/Medical_First_Aid_Box_Kit_Medicine-1024.png")),
    borderRadius: BorderRadius.circular(34),
    border: Border.all(color: Color.fromRGBO(0, 0, 0, 1), width: 2.0),
    color: Color.fromARGB(222, 5, 238, 168),
    
  ),
  height: 200,
  width: 350,
  child: InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TabContainer(
            tabletName,
            document['ExpiryDate'],
            document['Need'],
            document['TabCount'],
            document['Dosage'],
          ),
        ),
      );
    },
    child: Column(
      children: [
        const SizedBox(height: 30),
        Text(
          
          tabletName,
          style: const TextStyle(
            color: Color.fromARGB(255, 1, 73, 96),
            fontSize: 30,
            // fontStyle: FontStyle.
            fontWeight: FontWeight.w400,
            
          ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            child: const Icon(Icons.delete),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Are You Sure'),
                  content: const Text('You Want To Delete?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('Tablets')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('TabDetails')
                            .doc(document.id)
                            .delete();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  ),
),

            SizedBox(height: 20,),
          ],
        );
      },
    );
  },
);

  }
  

}