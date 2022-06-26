import 'package:flutter_coffee/screens/orders/get_orders.dart';
import 'package:flutter_coffee/screens/orders/create_orders.dart';
import 'package:flutter/material.dart';

class OrderDrawer extends StatefulWidget {
  const OrderDrawer({Key key}) : super(key: key);

  @override
  _OrderDrawerState createState() => _OrderDrawerState();
}

class _OrderDrawerState extends State<OrderDrawer> {
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Management")),
      body: Center(
        child: Text("Orders"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text("Order Management"),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
            ),
            ListTile(
              title: Text("Add Order"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterOrder()));
              },
            ),
            ListTile(
              title: Text("Show Orders"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetAllOrders()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
