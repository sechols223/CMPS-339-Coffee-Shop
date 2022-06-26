import 'package:flutter_coffee/screens/products/get_products.dart';
import 'package:flutter_coffee/screens/products/create_products.dart';
import 'package:flutter/material.dart';

class ProductDrawer extends StatefulWidget {
  const ProductDrawer({Key key}) : super(key: key);

  @override
  _ProductDrawerState createState() => _ProductDrawerState();
}

class _ProductDrawerState extends State<ProductDrawer> {
  final minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Management")),
      body: Center(
        child: Text("Products"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text("Product Management"),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
            ),
            ListTile(
              title: Text("Add Product"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterProduct()));
              },
            ),
            ListTile(
              title: Text("Show Products"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetAllProducts()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
