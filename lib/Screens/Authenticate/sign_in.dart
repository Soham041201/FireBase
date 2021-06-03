import 'package:flutter/material.dart';
import 'package:understanding_firebase/Screens/Authenticate/register.dart';
import 'package:understanding_firebase/Screens/Home/home.dart';
import 'package:understanding_firebase/Screens/models/modelDesign.dart';
import 'package:understanding_firebase/services/auth.dart';
import 'package:understanding_firebase/services/loading.dart';



class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   bool loading = false;
 final AuthService _auth = AuthService();
final _fromKey = GlobalKey<FormState>();
 String email = '';
 String password= '';  
 String error='';
  @override

  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //if you want to change any properties of the text field box then change it in the modelDesign.dart file
        backgroundColor: Colors.pink,
        title: Text('Sign In page'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:30,horizontal:30),
          child: Form(
            key: _fromKey,
            child: Column(
              children:[
                SizedBox(height:20),
                TextFormField(
                  style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500) ,
                  decoration: formDesign('Email'),
                  validator: (val) => val!.isEmpty ? 'Enter your Email':null ,
                  onChanged: (val){
                    
                    setState(()=>email=val);
                  },
                ),
                 SizedBox(height:20),
                TextFormField(
                   style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500) ,
                  decoration: formDesign('Password'),
                     validator: (val) => val!.length <6? 'Password should be more then 6 Characters':null ,
                  obscureText: true,
                  onChanged: (val){
                    setState(()=>password= val);
                  },
                ),
                ElevatedButton(onPressed:() async{
                 if(_fromKey.currentState!.validate()){
                    setState(() => loading = true);
                     dynamic result = await _auth.loginWithEmailAndPassword(email, password);
                   if(result==null){
                   setState(() {
                          error = 'Please Enter a valid Email Adress';
                          loading = false;
                        });
                   }
                   if(result!=null){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                   }
                 }
                 print(email);
                 print(password);
                }, child: Text('Submit'),),
                SizedBox(
                child: Center(child: Text('Not Registered Yet?')),
                height: 30,
                width: 500,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  child: Text('Register')),
                      
              Text(error),
              ]
            ),
          )),
    );
  }
}
