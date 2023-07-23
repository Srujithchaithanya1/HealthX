import '../Login/SingInPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome page',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SignInPage(),
    );
  }
}
