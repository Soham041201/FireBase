import 'package:flutter/material.dart';
import 'package:understanding_firebase/Screens/Authenticate/sign_in.dart';
import 'package:understanding_firebase/Screens/Home/home.dart';
import 'package:understanding_firebase/Screens/models/modelDesign.dart';
import 'package:understanding_firebase/services/auth.dart';
import 'package:understanding_firebase/services/loading.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  final AuthService _auth = AuthService();
  final _fromKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Registration Page')),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            key: _fromKey,
            child: Column(children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: formDesign('Email'),
                validator: (val) => val!.isEmpty ? 'Enter your Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: formDesign('Password'),
                validator: (val) => val!.length < 6
                    ? 'Password should be more then 6 Characters'
                    : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_fromKey.currentState!.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth
                          .registerUsingEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please Enter a valid Email Adress';
                          loading = false;
                        });
                      }
                      if (result != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }
                    }
                  },
                  child: Text('Submit')),
              SizedBox(
                child: Center(child: Text('Already Registered?')),
                height: 30,
                width: 500,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: Text('Sign In')),
              Text(error),
            ]),
          )),
    );
  }
}
