import 'package:flutter/material.dart';

class ExpenseStruct extends StatefulWidget {
  //var ti,gr;
  //expst({Key k1,@required this.ti, Key k2,@required this.gr}) : super(key: k1);
  //expst({Key key,@required this.ti}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ExpenseStruct> {
  //var ti;
  //_HomeState(this.ti);

  @override
  //var gr;
  //var ti;

  //final grcon = new TextEditingController();
  //final ticon = new TextEditingController();
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Expenses Structure"),
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
                  child: Text('Expenses Structure',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ),
                //Text('ti = $ti and gr = $gr'),
                // Container(
                //   padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
                //   child: Text(
                //       ti,
                //       style: TextStyle(
                //           fontSize: 30.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
                //   child: Text(
                //       gr,
                //       style: TextStyle(
                //           fontSize: 30.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)
                //   ),
                // ),
         
              ],
            ),
          ),
        ],
      ),
    );
  }
}
