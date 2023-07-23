import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthx/DataBase/Firebase_User.dart';
import 'LoggedIn.dart';

class SignInPage extends StatefulWidget {
  SignInState createState() => SignInState();
}

class SignInState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailId = TextEditingController();
  final pwd = TextEditingController();
  FireBase_User user = new FireBase_User();

  void dispose() {
    emailId.dispose();
    pwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LoggedIn();
          }
          return Scaffold(
            appBar: AppBar(
              title: Center(
                  child: Text(
                'Login',
                style: TextStyle(
                    color: Color.fromARGB(255, 1, 44, 18),
                    fontStyle: FontStyle.italic),
              )),
              backgroundColor: Color.fromARGB(255, 162, 236, 212),
              // elevation: 50,
              // toolbarHeight: 170,

              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_XpVCMJTSQt.json'),
                    Container(
                      decoration: const BoxDecoration(
                          // image: DecorationImage(
                          //   alignment: Alignment.bottomRight,
                          //   image: NetworkImage('https://cdn3.iconfinder.com/data/icons/cannabidiol-1/512/CBD-cannabidiol-cannabis-marijuana-glyph-06-512.png')),
                          color: Color.fromARGB(255, 85, 255, 201),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                              top: Radius.circular(20))),

                      height: 350,
                      width: 330,

                      // color: Color.fromARGB(222, 5, 238, 168),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'LOGIN',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                        Divider(
                          height: 20,
                          color: Colors.black,
                        ),
                        SizedBox(height: 25),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: emailId,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email address'),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: 300,
                          child: TextField(
                            controller: pwd,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password'),
                          ),
                        ),
                        // SizedBox(height:40),
                        ElevatedButton(
                            onPressed: signIn, child: Text('SignIn')),
                        ElevatedButton(
                            onPressed: signUp, child: Text('SignUp')),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<String?> signIn() async {
    user.Login(emailId.text.trim(), pwd.text.trim());
  }

  Future signUp() async {
    user.SignUp(emailId.text.trim(), pwd.text.trim());
  }
}
