
import 'package:dummy_project/common/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

const int pColor = 0xFF000000;
const int sColor = 0xFF606060;
const int tColor = 0xFFcc1717;
const int mColor = 0xFFF6F6F6;
final _formAddDelay = GlobalKey<ScaffoldState>();
String email = '';
final FirebaseAuth _auth = FirebaseAuth.instance;

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _formAddDelay,
        backgroundColor: Color(0xFFFFFFFF),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Image(
                      image: AssetImage('assets/DoctorLogo3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "Enter your Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                          color: Color(tColor),
                          width: 1.4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.010,
                  ),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: (Colors.blue[900])!,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.25,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        resetPassword(email).whenComplete(
                          () {
                            return _formAddDelay.currentState!.showSnackBar(
                              SnackBar(
                                backgroundColor: Color(tColor),
                                duration: Duration(seconds: 100),
                                content: Text(
                                    "A mail containing password reset details has been sent to you"),
                                action: SnackBarAction(
                                  label: "Okay",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Signin(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "Reset Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
