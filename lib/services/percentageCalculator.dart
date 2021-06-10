
class PercentageCalculator{
  
PercentageCalculator({required this.totalIncome, required this.education,required this.emi,required this.groceries,required this.housing,required this.shopping });
  final totalIncome;
  final groceries;
  final emi;
  final shopping;
  final housing;
  final education;



  
  double calculateEducationPercentage(double education,double housing,double,shopping,double emi,double groceries){
  return (education/ (education+housing+emi+shopping+groceries))*100;
    
  }
  double calculateEmiPercantage(double education,double housing,double,shopping,double emi,double groceries){
   return  (emi / (education+housing+emi+shopping+groceries))*100;
  }
  double calculateShoppingPercentage(double education,double housing,double,shopping,double emi,double groceries){
  return  (shopping / (education+housing+emi+shopping+groceries))*100;
  }
  double calculateHousingPercentage(double education,double housing,double,shopping,double emi,double groceries){
  return (housing / (education+housing+emi+shopping+groceries))*100;
  }
  double calculateGroceries(double education,double housing,double,shopping,double emi,double groceries){
   return (groceries / (education+housing+emi+shopping+groceries))*100;
  }


}
