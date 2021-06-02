import 'package:flutter/material.dart';
import 'package:understanding_firebase/Screens/models/music.dart';
import 'package:understanding_firebase/services/auth.dart';
import 'package:understanding_firebase/services/database.dart';
import 'package:provider/provider.dart';
import 'package:understanding_firebase/Screens/Home/bodydata.dart';
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
 
  Widget build(BuildContext context) {
    return StreamProvider<List<Music>>.value(
          value: DataBase(uid:'').music,
          initialData: [],
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text('Home Page', textAlign: TextAlign.justify),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Icon(Icons.account_box),
            )
          ],
        ),
        body: BodyData(),
      ),
    );
  }
}

