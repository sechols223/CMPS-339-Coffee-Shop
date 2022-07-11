// ignore_for_file: missing_return, duplicate_ignore

import 'dart:convert';

import 'package:flutter_coffee/models/Order_model.dart';
import 'package:flutter_coffee/screens/app_drawer.dart';
import 'package:flutter_coffee/screens/orders/order_drawer.dart';
import 'package:flutter_coffee/screens/orders/create_orders.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class UpdateOrder extends StatefulWidget {
  OrderModel orderModel;

  UpdateOrder({this.orderModel});

  @override
  _UpdateOrderState createState() => _UpdateOrderState(orderModel);
}

// ignore: missing_return
Future<OrderModel> updateOrders(
    OrderModel orderModel, BuildContext context) async {
  var url =
      "https://coffeeshop-staging.herokuapp.com/api/orders"; // spring boot for updating orders
  var response = await http.put(url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(orderModel));
  if (response.statusCode == 200) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return MyAlertDialog(
              title: "Backend Response", content: response.body);
        });
  }
}

class _UpdateOrderState extends State<UpdateOrder> {
  OrderModel orderModel;
  final minimumPadding = 5.0;
  TextEditingController orderNumber;
  bool _isEnabled = false;
  Future<List<OrderModel>> orders;
  TextEditingController firstController;
  TextEditingController secondController;
  TextEditingController thirdController;
  TextEditingController lastController;

  _UpdateOrderState(this.orderModel) {
    orderNumber = TextEditingController(text: this.orderModel.id.toString());
    firstController =
        TextEditingController(text: this.orderModel.customerid.toString());
    secondController =
        TextEditingController(text: this.orderModel.productid.toString());
    thirdController =
        TextEditingController(text: this.orderModel.price.toString());
    lastController =
        TextEditingController(text: this.orderModel.amount.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;

    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text("Update Order"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AppDrawer()));

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderDrawer()));
          },
        ),
      ),
      body: Container(
          child: Form(
              child: Padding(
        padding: EdgeInsets.all(minimumPadding * 2),
        child: ListView(children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
            child: TextFormField(
              style: textStyle,
              controller: orderNumber,
              enabled: _isEnabled,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter Order ID";
                }
              },
              decoration: InputDecoration(
                  labelText: "Order ID",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
            child: TextFormField(
              style: textStyle,
              controller: firstController,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter Customer ID";
                }
              },
              decoration: InputDecoration(
                  labelText: "Enter Customer ID",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
            child: TextFormField(
              style: textStyle,
              controller: lastController,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter Product ID";
                }
              },
              decoration: InputDecoration(
                  labelText: "Enter Product ID",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
            child: TextFormField(
              style: textStyle,
              controller: lastController,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter Amount";
                }
              },
              decoration: InputDecoration(
                  labelText: "Enter Amount",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
            child: TextFormField(
              style: textStyle,
              controller: thirdController,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter Price";
                }
              },
              decoration: InputDecoration(
                  labelText: "Enter Price",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          ElevatedButton(
              child: Text("Update Details"),
              onPressed: () async {
                OrderModel emp = new OrderModel();
                emp.id = orderModel.id;
                emp.customerid = firstController.text as int;
                emp.productid = lastController.text as int;
                emp.amount = secondController.text as int;
                emp.price = thirdController.text;

                OrderModel orders = await updateOrders(emp, context);
                setState(() {
                  orderModel = orders;
                });
              })
        ]),
      ))),
    );
  }
}
