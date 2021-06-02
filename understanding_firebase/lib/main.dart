import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:understanding_firebase/Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:understanding_firebase/services/auth.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
          value:  AuthService().user ,
          initialData: null,
          child: MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Wrapper(),
      ),
    );
  }
}

