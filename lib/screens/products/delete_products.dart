//able to delete a product from database from the app
import 'dart:convert';

import 'package:flutter_coffee/models/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coffee/screens/products/product_drawer.dart';
import 'package:http/http.dart' as http;

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({Key /*!*/ key}) : super(key: key);

  @override
  _DeleteProductState createState() => _DeleteProductState();
}

Future<ProductModel> deleteProduct(int id, String name, String size) async {
  final http.Response response = await http.delete(
    Uri.parse('https://coffeeshop-staging.herokuapp.com/api/products/:id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    return ProductModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete product.');
  }
}

class _DeleteProductState extends State<DeleteProduct> {
  @override
  Widget build(BuildContext context) {
    return ProductDrawer();
  }
}
