import 'package:flutter/material.dart';

class Records extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Records> {
  final TextEditingController _controller = TextEditingController();

  String totalIncome ='';
  String emi ='';
  String groceries ='';
  String shopping ='';
  String education ='';
  String housing ='';
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
                        onPressed: () {},
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
                      controller: _controller,
                      onChanged: (val){
                        setState(()=> totalIncome=val);
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
                        controller: _controller,
                      onChanged: (val){
                        setState(()=> groceries=val);
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
                        controller: _controller,
                      onChanged: (val){
                        setState(()=> emi=val);
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
                        controller: _controller,
                      onChanged: (val){
                        setState(()=> shopping=val);
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
                        controller: _controller,
                      onChanged: (val){
                        setState(()=> housing=val);
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
                        controller: _controller,
                      onChanged: (val){
                        setState(()=> education=val);
                      },
                      decoration: InputDecoration(
                          labelText: 'EDUCATION',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink))),
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

class DataofUser{
String totalIncome;
  String emi;
  String groceries;
  String shopping;
  String education;
  String housing;

DataofUser({required this.totalIncome,required this.education,required this.emi,required this.groceries,required this.housing,required this.shopping});

}
