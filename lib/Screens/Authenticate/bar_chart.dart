import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';




// ignore: must_be_immutable
class BarGraph extends StatefulWidget {
    BarGraph({required this.percentageEducation,required this.percentageEmi,required this.percentageGroceries,required this.percentageHousing,required this.percentageShopping});
  final double percentageEducation;
  final double percentageShopping;
  final double percentageEmi;
  final double percentageHousing;
  final double percentageGroceries;

  // ignore: prefer_const_constructors_in_immutables
  
 late List<_SalesData> data;
  @override
  BarGraphState createState() => BarGraphState();
}

class BarGraphState extends State<BarGraph> {
   late List<_SalesData> data;
 
  @override
   void initState() {
    
    super.initState();
     data = [
    _SalesData("Shopping",widget.percentageShopping,),
    _SalesData("Education", widget.percentageEducation),
    _SalesData( "EMI", widget.percentageEmi,),
    _SalesData( "Housing", widget.percentageHousing),
    _SalesData("Groceries", widget.percentageGroceries,)
  ];

  }
 
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses Structure Bar Graph'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SfCartesianChart(
            
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Expenses Structure'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable:false),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Expenses',
                    // Enable data label
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}