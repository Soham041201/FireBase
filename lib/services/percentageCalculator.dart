
class PercentageCalculator{
  
  
PercentageCalculator({required this.totalIncome, required this.education,required this.emi,required this.groceries,required this.housing,required this.shopping });
  final totalIncome;
  final groceries;
  final emi;
  final shopping;
  final housing;
  final education;

  
  
  double percentageEducation=0;
  double percentageShopping=0;
  double percentageEmi=0;
  double percentageHousing=0;
  double percentageGroceries=0;

  double calculateEducationPercentage(){
    percentageEducation = (education / (education+housing+emi+shopping+groceries))*100;
    return percentageEducation;
  }
  double calculateEmiPercantage(){
   return percentageEmi = (emi / (education+housing+emi+shopping+groceries))*100;
  }
  double calculateShoppingPercentage(){
  return percentageShopping = (shopping / (education+housing+emi+shopping+groceries))*100;
  }
  double calculateHousingPercentage(){
  return percentageHousing = (housing / (education+housing+emi+shopping+groceries))*100;
  }
  double calculateGroceries(){
   return percentageGroceries = (groceries / (education+housing+emi+shopping+groceries))*100;
  }


}