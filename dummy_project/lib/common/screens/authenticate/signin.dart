import 'package:dummy_project/common/screens/authenticate/forgotpass.dart';
import 'package:dummy_project/common/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:dummy_project/common/screens/authenticate/register.dart';
import 'package:dummy_project/common/screens/authenticate/registersociety.dart';
import 'package:dummy_project/common/services/auth.dart';

const int pColor = 0xFF000000;
const int sColor = 0xFF606060;
const int tColor = 0xFFcc1717;
const int mColor = 0xFFF6F6F6;

class Signin extends StatefulWidget {

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  //declaring the variables
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Container(
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
                    cursorColor: (Colors.blue[900])!,
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                          color: (Colors.blue[900])!,
                          width: 1.4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.010,
                  ),
                  TextFormField(
                    cursorColor: (Colors.blue[900])!,
                    obscureText: true,
                    validator: (val) => val!.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                          color: (Colors.blue[900])!,
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
                        if (_formkey.currentState!.validate()) {
                          dynamic result = await _auth.signinwithemailandpass(
                              email, password);
                          print(result);
                          if (result == true) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Wrapper()));
                          }
                          if (result == null) {
                            setState(() {
                              error =
                                  'Could not sign in with those credentials';
                            });
                          } else if (result == false) {
                            setState(() {
                              error = 'Email not Verified';
                            });
                          }
                        }
                      },
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Color(0xFFFFFFFF),
                    onPressed: () {
                       showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Choose SignIn Option"),
                              actions: <Widget>[
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.010,
                                ),
                                Material(
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: (Colors.blue[900])!,
                                  child: MaterialButton(
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.25,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Register(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Register as a Receptionist           ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                //register as a admin
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.010,
                                ),
                                Material(
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: (Colors.blue[900])!,
                                  child: MaterialButton(
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.25,
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterSociety(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Register as a Clinic                             ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ),
                  InkWell(
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotScreen()));
                      }),
                  Text(
                    error,
                    style:
                        TextStyle(color: (Colors.blue[900])!, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
