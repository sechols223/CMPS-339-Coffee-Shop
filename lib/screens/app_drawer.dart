import 'package:flutter_coffee/screens/customers/get_customers.dart';
import 'package:flutter_coffee/screens/orders/get_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee/screens/products/get_products.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Management"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text("Show Items in Database"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 0, bottom: 0),
          children: <Widget>[
            DrawerHeader(
              child: Text("Coffee Shop Database"),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
            ),
            ListTile(
              title: Text("Show All Orders"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetAllOrders()));
              },
            ),
            ListTile(
              title: Text("Show All Products"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetAllProducts()));
              },
            ),
            ListTile(
              title: Text("Show All Customers"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetAllCustomers()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
