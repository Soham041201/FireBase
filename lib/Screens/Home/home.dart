import 'package:flutter/material.dart';
import 'package:understanding_firebase/Screens/Home/appDrawer.dart';
import 'package:understanding_firebase/Screens/models/music.dart';
import 'package:understanding_firebase/homePage_options/balalance_trade.dart';
import 'package:understanding_firebase/homePage_options/records.dart';
import 'package:understanding_firebase/homePage_options/upplpay.dart';
import 'package:understanding_firebase/services/auth.dart';
import 'package:understanding_firebase/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Music>>.value(
      value: DataBase(uid: '').music,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          title: new Text("Home Page"),
          backgroundColor: Colors.pink,
          actions: [
            TextButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Icon(Icons.account_box),
            )
          ],
        ),
        drawer: AppDrawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Records(),
              ),
            );
          },
          child: Text(
            '+',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              fontSize: 40.0,
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
                      child: Text('Accounts',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft),
                    Container(
                        padding: EdgeInsets.fromLTRB(25.0, 40.0, 0.0, 0.0),
                        child: Material(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Records(),
                              ),
                            );
                          },
                          child: Text('Records',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold)),
                        ))),
                  ],
                ),
              ),
              
              Container(
                child: Stack(
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 30.0, 0.0, 0.0),
                      child: Material(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BalanceTrade(),
                              ),
                            );
                          },
                          child: Text('Balance Trend',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 30.0, 25.0, 0.0),
                      child: Material(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Upplpay(),
                              ),
                            );
                          },
                          child: Text('Upcoming planned payments',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //Scaffold(
      //   appBar: AppBar(
      //     backgroundColor: Colors.purple,
      //     title: Center(
      //       child: Text('Home Page', textAlign: TextAlign.justify),
      //     ),
      //     actions: [
      //       TextButton(
      //         onPressed: () async {
      //           await _auth.signOut();
      //         },
      //         child: Icon(Icons.account_box),
      //       )
      //     ],
      //   ),
      //   body: BodyData(),
      // ),
    );
  }
}
//  Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => Home()),
//                             );
