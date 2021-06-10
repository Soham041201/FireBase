import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:understanding_firebase/Screens/Authenticate/bar_chart.dart';
import 'package:understanding_firebase/Screens/Authenticate/pie_data.dart';
import 'package:understanding_firebase/services/percentageCalculator.dart';

class Records extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Records> {
  final TextEditingController _controller = TextEditingController();
  double totalIncome = 0;
  double groceries = 0;
  double emi = 0;
  double shopping = 0;
  double housing = 0;
  double education = 0;
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
                                  emi: emi,
                                  groceries: groceries,
                                  housing: housing,
                                  shopping: shopping);
                          _controller.clear();
                          print(myCalculator.education);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pie(
                                  percentageEducation:
                                      myCalculator.calculateEducationPercentage(
                                          education, housing, double, shopping, emi, groceries),
                                  percentageEmi: myCalculator.calculateEmiPercantage(
                                      education, housing, double, shopping, emi, groceries),
                                  percentageGroceries: myCalculator.calculateGroceries(
                                      education, housing, double, shopping, emi, groceries),
                                  percentageHousing:
                                      myCalculator.calculateHousingPercentage(
                                          education, housing, double, shopping, emi, groceries),
                                  percentageShopping:
                                      myCalculator.calculateShoppingPercentage(
                                          education,
                                          housing,
                                          double,
                                          shopping,
                                          emi,
                                          groceries)),
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
                      onChanged: (String val) {
                        totalIncome = double.parse(val);
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
                      onChanged: (val) async {
                        setState(() => groceries = double.parse(val));
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
                      onChanged: (val) async {
                        setState(() => emi = double.parse(val));
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
                      onChanged: (val) async {
                        setState(() => shopping = double.parse(val));
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
                      onChanged: (val) async {
                        setState(() => housing = double.parse(val));
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
                      onChanged: (val) async {
                        setState(() => education = double.parse(val));
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
                    SizedBox(height: 40),
                    CupertinoButton(color: Colors.pink,child: Text('See Bar Graph'), onPressed: () async {
                          PercentageCalculator myCalculator =
                              PercentageCalculator(
                                  totalIncome: totalIncome,
                                  education: education,
                                  emi: emi,
                                  groceries: groceries,
                                  housing: housing,
                                  shopping: shopping);
                          _controller.clear();
                          print(myCalculator.education);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BarGraph(
                                  percentageEducation:
                                      myCalculator.calculateEducationPercentage(
                                          education, housing, double, shopping, emi, groceries),
                                  percentageEmi: myCalculator.calculateEmiPercantage(
                                      education, housing, double, shopping, emi, groceries),
                                  percentageGroceries: myCalculator.calculateGroceries(
                                      education, housing, double, shopping, emi, groceries),
                                  percentageHousing:
                                      myCalculator.calculateHousingPercentage(
                                          education, housing, double, shopping, emi, groceries),
                                  percentageShopping:
                                      myCalculator.calculateShoppingPercentage(
                                          education,
                                          housing,
                                          double,
                                          shopping,
                                          emi,
                                          groceries)),
                            ),
                          );
                        }, )
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
