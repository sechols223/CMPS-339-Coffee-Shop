//able to delete a order from database from the app
import 'dart:convert';

import 'package:flutter_coffee/models/Order_model.dart';
import 'package:flutter_coffee/screens/orders/get_orders.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteOrder extends StatefulWidget {
  const DeleteOrder({Key /*!*/ key}) : super(key: key);

  @override
  _DeleteOrderState createState() => _DeleteOrderState();
}

Future<OrderModel> deleteOrder(String name, String size) async {
  var url =
      'https://coffeeshop-staging.herokuapp.com/api/orders/:customerid/:orderid'; //springboot for deleting orders
  var response = await http.delete(
    url,
    headers: <String, String>{"Content-Type": "application/json;charset=UTF-8"},
  );
  return OrderModel.fromJson(jsonDecode(response.body));
}

class _DeleteOrderState extends State<DeleteOrder> {
  @override
  Widget build(BuildContext context) {
    return GetAllOrders();
  }
}
