import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dummy_project/common/screens/authenticate/signin.dart';
import 'package:dummy_project/common/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


const int pColor = 0xFF000000;
const int sColor = 0xFF606060;
const int tColor = 0xFFcc1717;
const int mColor = 0xFFF6F6F6;
final _formAddDelay = GlobalKey<ScaffoldState>();

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  //declaring the variables
  String error = '';
  String email = '';
  String password = '';
  String name = '';
  String flatno = '';
  String society = '';
  String noofpeople = '';
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
        title: const Text('Register Receptionist'),
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
                          cursorColor: (Colors.blue[900])!,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            labelText: 'Name of the User',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: (Colors.blue[900])!,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter the name' : null,
                          onChanged: (value) {
                            name = value;
                          },
                          onSaved: (String? addactivityname) {
                            name = addactivityname!;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Select your Clinic",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Registered Clinics')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData)
                              return const Text('Loading...');
                            else {
                              return new DropdownButton<String>(
                                isDense: false,
                                isExpanded: true,
                                value: society,
                                items: snapshot.data!.docs.map((map) {
                                  return DropdownMenuItem<String>(
                                    value: map["Name"].toString(),
                                    child: Text(
                                      map["Name"],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  {
                                    setState(() {
                                      society = newValue!;
                                    });
                                  }
                                },
                              );
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: (Colors.blue[900])!,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            labelText: 'Enter your Phone number',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: (Colors.blue[900])!,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your phone number' : null,
                          onChanged: (value) {
                            flatno = value;
                          },
                          onSaved: (String? addactivityname) {
                            flatno = addactivityname!;
                          },
                        ),
                      ),
                      //email
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextFormField(
                          cursorColor: (Colors.blue[900])!,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: (Colors.blue[900])!,
                              ),
                            ),
                          ),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                          onSaved: (String? addactivityname) {
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
                          cursorColor: (Colors.blue[900])!,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: (Colors.blue[900])!,
                              ),
                            ),
                          ),
                          validator: (val) => val!.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onSaved: (String? addactivityname) {
                            password = addactivityname!;
                          },
                          onChanged: (value) {
                            setState(
                              () {
                                password = value;
                              },
                            );
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
                                    _auth.registerwithemailandpassuser(
                                  email,
                                  password,
                                  name,
                                  society,
                                );
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'Please register your society first by contacting our team';
                                  });
                                } else if (result == true) {
                                  SnackBar(
                                    duration: Duration(seconds: 100),
                                    backgroundColor: (Colors.blue[900])!,
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
                                        }),
                                  );
                                }
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
