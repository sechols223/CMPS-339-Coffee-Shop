import 'package:flutter_coffee/screens/products/get_products.dart';
import 'package:flutter_coffee/screens/products/create_products.dart';
import 'package:flutter/material.dart';

class ProductDrawer extends StatefulWidget {
  const ProductDrawer({Key key}) : super(key: key);

  @override
  _ProductDrawerState createState() => _ProductDrawerState();
}

class _ProductDrawerState extends State<ProductDrawer> {
  final minimumPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Management"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text("Products"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 0, bottom: minimumPadding),
          children: <Widget>[
            DrawerHeader(
              child: Text("Product Options: "),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
            ),
            ListTile(
              title: Text("All Products"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GetAllProducts()));
              },
            ),
            ListTile(
              title: Text("Add Product"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterProduct()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
