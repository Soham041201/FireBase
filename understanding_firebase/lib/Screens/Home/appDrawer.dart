import 'package:flutter/material.dart';
import 'package:understanding_firebase/appDrawer_options/bankSync.dart';
import 'package:understanding_firebase/appDrawer_options/totalIncome.dart';
import 'package:understanding_firebase/appDrawer_options/education.dart';
import 'package:understanding_firebase/appDrawer_options/expenditure.dart';
import 'package:understanding_firebase/appDrawer_options/groceries.dart';
import 'package:understanding_firebase/appDrawer_options/healthCare.dart';
import 'package:understanding_firebase/appDrawer_options/emi.dart';
import 'package:understanding_firebase/appDrawer_options/shoppingLists.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            child: DrawerHeader(
              child: Text('Menu Bar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  )),
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, size: 30),
            title: Text('Bank Sync', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BankSync(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet, size: 30),
            title: Text('Total Income', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TotalIncome(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.menu_book_rounded, size: 30),
            title: Text('Education', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Education(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_outlined, size: 30),
            title: Text('Shopping Lists', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingList(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.emoji_transportation, size: 30),
            title: Text('Expenditure', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Expenditure(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.local_grocery_store, size: 30),
            title: Text('Groceries', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Groceries(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.medical_services_outlined, size: 30),
            title: Text('Health Care', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HealthCare(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.save_outlined, size: 30),
            title: Text('EMI', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Emi(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
