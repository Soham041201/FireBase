import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
    
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(height: 200,
                child: DrawerHeader(
                    
                   child: Text('Menu Bar', style: TextStyle(color: Colors.white, fontSize: 30,)),
                    decoration: BoxDecoration(
                    
                    color: Colors.pink,
         ),
      ),
              ),
              ListTile(
                leading: Icon(Icons.home, size: 30),
                title: Text('Bank Sync', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.save_alt, size: 30),
                title: Text('Imports', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.list, size: 30),
                title: Text('Records', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.stacked_line_chart, size: 30),
                title: Text('Statistics', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.account_balance_wallet, size: 30),
                title: Text('Total Income', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.payments, size: 30),
                title: Text('Planned Payments', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.money, size: 30),
                title: Text('Budgets', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.remove_done, size: 30),
                title: Text('Debts', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment_outlined, size: 30),
                title: Text('Goals', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket_outlined, size: 30),
                title: Text('Shopping Lists', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.local_grocery_store, size: 30),
                title: Text('Groceries', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.fastfood_rounded, size: 30),
                title: Text('Food and beverages', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.house_rounded, size: 30),
                title: Text('Housing', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.emoji_transportation, size: 30),
                title: Text('Transportation', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.bike_scooter, size: 30),
                title: Text('Vehicle', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.live_tv_outlined, size: 30),
                title: Text('Entertainment', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.menu_book_rounded, size: 30),
                title: Text('Education', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.medical_services_outlined, size: 30),
                title: Text('Health Care', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.wifi, size: 30),
                title: Text('Internet', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
              ListTile(
                leading: Icon(Icons.save_outlined, size: 30),
                title: Text('EMI', style: TextStyle(fontSize: 20)),
                onTap: () {
                },
              ),
    ],
    ),
      
      );
  }
}