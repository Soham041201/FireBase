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
  String name ='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(child: Text('Finance Manager')),
      ),
      
      body: Container(
    
                
                
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            key: _fromKey,
            child: Column(children: [
              SizedBox(height: 20),
               Text('Sign Up Details',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 20),
                           TextFormField(
                                 style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500) ,
                decoration: formDesign('Enter your name'),
                validator: (val) => val!.isEmpty ? 'Enter your Name' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                    style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500) ,
                decoration: formDesign('Email'),
                validator: (val) => val!.isEmpty ? 'Enter your Email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                    style: TextStyle(
                      
                          fontSize: 20.0, fontWeight: FontWeight.w500) ,
                decoration: formDesign('Password'),
                validator: (val) => val!.length < 6
                    ? 'Password should be more then 6 Characters'
                    : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),

              Row(
                children: [
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
                      SizedBox(height: 50,width:30,),
                       SizedBox(
                child: Center(child: Text('Already Registered?')),
                height: 40,
                width: 100,
              ),
               ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: Text('Sign In')) ],
              ),
             
              
              Text(error),
            ]),
          )),
    );
  }
}
