// ignore_for_file: must_be_immutable, unused_local_variable
//shows all products in the database in the app

import 'dart:convert';

import 'package:flutter_coffee/models/Product_model.dart';
import 'package:flutter_coffee/screens/products/delete_products.dart';
import 'package:flutter_coffee/screens/products/product_drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllProducts extends StatefulWidget {
  const GetAllProducts({Key key}) : super(key: key);

  @override
  _GetAllProductsState createState() => _GetAllProductsState();
}

class _GetAllProductsState extends State<GetAllProducts> {
  var products = List<ProductModel>.generate(200, (index) => null);

  Future<List<ProductModel>> getAllProducts() async {
    var data = await http.get(':8080/api/products');
    var jsonData = json.decode(data.body);

    List<ProductModel> product = [];
    for (var e in jsonData) {
      ProductModel products = new ProductModel();
      products.id = e["id"];
      products.name = e["name"];
      products.size = e["size"];
      product.add(products);
    }
    return product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All products Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductDrawer()));
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getAllProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Icon(Icons.error));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('ID' + ' ' + 'name' + ' ' + 'size'),
                    subtitle: Text('${snapshot.data[index].id}' +
                        ' ' +
                        '${snapshot.data[index].name}' +
                        '  ' +
                        '${snapshot.data[index].size}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(snapshot.data[index])));
                    },
                  );
                });
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  ProductModel productModel;

  DetailPage(this.productModel);

  deleteProduct1(ProductModel productModel) async {
    final url = Uri.parse('/api/products/:id');
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(productModel);
    final response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productModel.name),
        actions: <Widget>[],
      ),
      body: Container(
        child: Text(
            'name' + ' ' + productModel.name + ' ' 'size' + productModel.size),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deleteProduct1(productModel);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DeleteProduct()));
        },
        child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
