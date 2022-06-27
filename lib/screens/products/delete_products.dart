//able to delete a product from database from the app
import 'dart:convert';

import 'package:flutter_coffee/models/Product_model.dart';
import 'package:flutter_coffee/screens/products/get_products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({Key /*!*/ key}) : super(key: key);

  @override
  _DeleteProductState createState() => _DeleteProductState();
}

Future<ProductModel> deleteProduct(String name, String size) async {
  var url = "http://localhost:8080/api/products/:id";
  var response = await http.delete(
    url,
    headers: <String, String>{"Content-Type": "application/json;charset=UTF-8"},
  );
  return ProductModel.fromJson(jsonDecode(response.body));
}

class _DeleteProductState extends State<DeleteProduct> {
  @override
  Widget build(BuildContext context) {
    return GetAllProducts();
  }
}
