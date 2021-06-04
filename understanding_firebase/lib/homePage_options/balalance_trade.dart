import 'package:flutter/material.dart';

class BalanceTrade extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<BalanceTrade> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Balance Trade"),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: <Widget>[
          Align(alignment: Alignment.centerLeft),
          Container(
            padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
            child: Text('Balance Trend',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline)),
          ),
        ],
      ),
    );
  }
}
