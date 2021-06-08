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
        body: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 50,
        chartRadius: MediaQuery.of(context).size.width / 3,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth:20,
        centerText: "",
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
          ),
      ),
    );
  }
}


 

 

 