import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:understanding_firebase/Screens/Authenticate/authenticate.dart';
import 'package:understanding_firebase/Screens/Home/home.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    print(user);
      //return widget on the base of condition Authentication or Home
    if(user !=null){
      return Home();
    }
    else{
    return Authenticate();
    }
    
  }
}