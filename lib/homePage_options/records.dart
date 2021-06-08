import 'package:flutter/material.dart';
import 'package:understanding_firebase/Screens/Authenticate/pie_data.dart';

import 'package:understanding_firebase/services/percentageCalculator.dart';


class Records extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Records> {
  final TextEditingController _controller = TextEditingController();
  double totalIncome = 0;
  double groceries =0;
  double emi = 0;
  double shopping = 0;
  double housing = 0;
  double education =0;
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text("Records"),
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft),
                    Container(
                      padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
                      child: Text('Records',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    ),
                    Align(alignment: Alignment.topRight),
                    Container(
                      margin: EdgeInsets.fromLTRB(270, 20, 10, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.pink),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(color: Colors.red)),
                          ),
                        ),
                        onPressed: () async {
                          PercentageCalculator myCalculator =
                              PercentageCalculator(
                                  totalIncome: totalIncome,
                                  education: education,
                                  emi: emi.toString(),
                                  groceries: groceries.toString(),
                                  housing: housing.toString(),
                                  shopping: shopping.toString());
                          _controller.clear();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>Pie(percentageEducation: myCalculator.percentageEducation,percentageEmi: myCalculator.percentageEmi,percentageGroceries: myCalculator.percentageGroceries,percentageHousing: myCalculator.percentageGroceries, percentageShopping: myCalculator.percentageShopping),
                            ),
                          );
                        },
                        child: Text(
                          'ADD',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 20.0, left: 50.0, right: 50.0, bottom: 0.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        val= totalIncome.toString();
                      },
                      decoration: InputDecoration(
                          labelText: 'TOTAL INCOME',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) async{
                        setState(() =>val = groceries.toString());
                      },
                      decoration: InputDecoration(
                          labelText: 'GROCERIES',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) async{
                        setState(() =>val = emi.toString());
                      },
                      decoration: InputDecoration(
                          labelText: 'EMI',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) async{
                      setState(() =>val = shopping.toString());
                      },
                      decoration: InputDecoration(
                          labelText: 'SHOPPING',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) async{
                    setState(() =>val = housing.toString());
                      },
                      decoration: InputDecoration(
                          labelText: 'HOUSING',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink))),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      keyboardType: TextInputType.number,
                      onChanged: (val) async{
                   setState(() =>val = education.toString());
                      },
                      decoration: InputDecoration(
                        labelText: 'EDUCATION',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink),
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
    );
  }
}
