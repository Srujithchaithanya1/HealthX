import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FireBase_User
{

  String ?user_Email;
  String ?user_Id;
  FireBase_User()
  {
      user_Email="";
      user_Id="";
  }

  SignUp(String email,String password)
  async {
    this.user_Email=email;
    UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    this.user_Id=user.user!.uid;
    await FirebaseFirestore.instance.collection("F_User").doc(this.user_Id).set({
      'user email': this.user_Email,
      'u_id':this.user_Id 
    });
  }
  Login(String email,String password)  async
  {
    this.user_Email=email;
    UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    this.user_Id=FirebaseAuth.instance.currentUser!.uid;

  }

  String getUserId()
  {
    return this.user_Id.toString();
  }


  
}