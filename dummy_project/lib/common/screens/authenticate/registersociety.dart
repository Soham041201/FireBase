
import 'package:dummy_project/common/screens/authenticate/signin.dart';
import 'package:dummy_project/common/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const int pColor = 0xFF000000;
const int sColor = 0xFF606060;
const int tColor = 0xFFcc1717;
const int mColor = 0xFFF6F6F6;
final _formAddDelay = GlobalKey<ScaffoldState>();

class RegisterSociety extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterSociety> {
  final AuthService _auth = AuthService();

  //declaring the variables
  String error = '';
  String email= '';
  String password= '';
  String name= '';
  String address= '';
  String flats= '';
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: (Colors.blue[900])!,
          title: const Text('Register Clinic'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            cursorColor: Color(tColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              labelText: 'Name of the Clinic',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(tColor),
                                ),
                              ),
                            ),
                            validator: (val) =>
                              val!.isEmpty ? 'Enter Name of the Clinic' : null,
                            onChanged: (value) {
                              name = value;
                            },
                            onSaved: (String ?addactivityname) {
                              name = addactivityname!;
                            },
                          ),
                        ),
                        //address
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            cursorColor: Color(tColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              labelText: 'Enter address of the Clinic',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(tColor),
                                ),
                              ),
                            ),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter the address' : null,
                            onChanged: (value) {
                              address = value;
                            },
                            onSaved: (String ?addactivityname) {
                              address = addactivityname!;
                            },
                          ),
                        ),
                        //email
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            cursorColor: Color(tColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(tColor),
                                ),
                              ),
                            ),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter an email' : null,
                            onSaved: (String ?addactivityname) {
                              email = addactivityname!;
                            },
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                          ),
                        ),
                        //password
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            cursorColor: Color(tColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(tColor),
                                ),
                              ),
                            ),
                            validator: (val) => val!.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            onSaved: (String ?addactivityname) {
                              password = addactivityname!;
                            },
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                          ),
                        ),
                        //total no of flats
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            cursorColor: Color(tColor),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              labelText: 'Total number of doctors',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(tColor),
                                ),
                              ),
                            ),
                            validator: (val) =>
                              val!.isEmpty ? 'Enter no of Doctors' : null,
                            onChanged: (value) {
                              setState(() {
                                flats = value;
                              });
                            },
                            onSaved: (String ?addactivityname) {
                              flats = addactivityname!;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            color: (Colors.blue[900])!,
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                dynamic result =
                                    await _auth.registerwithemailandpass(
                                        email, password, name, address, flats);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Please register your Clinic first by contacting our team';
                                  });
                                } else if (result == true) {
                                   SnackBar(
                                    duration: Duration(seconds: 100),
                                    backgroundColor: Color(tColor),
                                    content: Text(
                                        "A verification email has been sent to your email id"),
                                    action: SnackBarAction(
                                      label: "Okay",
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Signin()));
                                      },
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validatename(String val) {
    return val.length == 0 ? "Enter Name first" : null;
  }
}
