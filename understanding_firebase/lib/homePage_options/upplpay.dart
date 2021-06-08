import 'package:flutter/material.dart';

class Upplpay extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Upplpay> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Upcoming Planned Payments"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Align(alignment: Alignment.centerLeft),
                Container(
                  padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Upcoming Planned Payments',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
