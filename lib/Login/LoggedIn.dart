import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthx/main.dart';
import 'package:flutter/material.dart';

class LoggedIn extends StatelessWidget {
  static signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyApp(),);
  }
}
