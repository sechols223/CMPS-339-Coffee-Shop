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
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Management")),
      body: Center(
        child: Text("Files"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text("App Management"),
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
