import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// ignore: must_be_immutable
class Pie extends StatefulWidget {


  
   Pie({required this.percentageEducation,required this.percentageEmi,required this.percentageGroceries,required this.percentageHousing,required this.percentageShopping});
  final double percentageEducation;
  final double percentageShopping;
  final double percentageEmi;
  final double percentageHousing;
  final double percentageGroceries;

  @override
  _PieDataState createState() => _PieDataState();
}

class _PieDataState extends State<Pie> {
   List<Color> colorList = [Colors.red,Colors.green,Colors.blue,Colors.yellow,Colors.pink];
late Map<String, double> dataMap;
@override
  void initState() {
    
    super.initState();
     dataMap = {
    "Shopping":widget.percentageShopping,
    "Education": widget.percentageEducation,
    "EMI": widget.percentageEmi,
    "Housing": widget.percentageHousing,
    "Groceries": widget.percentageGroceries,
  };
  print(widget.percentageEducation);
  
  print(widget.percentageEmi);
  print(widget.percentageGroceries);
  print(widget.percentageHousing);
  print(widget.percentageShopping);
  }

  @override
  
  Widget build(BuildContext context) {
    return  Container(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Expense Structure',textScaleFactor: 2,style: TextStyle(fontSize: 15),),
            SizedBox(height: 100,),
            PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 50,
            chartRadius: MediaQuery.of(context).size.width / 1.5,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.disc,
            ringStrokeWidth:50,
            centerText: "",
            legendOptions: LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              showLegends: true,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: false,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
              ),
          
          ],
        ),
      ),
    );
  }
}


 

 

 