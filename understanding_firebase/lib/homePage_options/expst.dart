import 'package:flutter/material.dart';
import 'package:understanding_firebase/Screens/Home/pie_chart_page.dart';

class ExpenseStruct extends StatefulWidget {
 
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ExpenseStruct> {
  

  @override
 
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Expenses Structure"),
        backgroundColor: Colors.pink,
      ),
      body: PieChartPage()
    );
  }
}
