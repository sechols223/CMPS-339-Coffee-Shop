// ignore_for_file: missing_return, unused_local_variable, deprecated_member_use
//adds models to the app to the database

import 'dart:convert';

import 'package:flutter_coffee/models/Order_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterOrder extends StatefulWidget {
  const RegisterOrder({Key key}) : super(key: key);

  @override
  State<RegisterOrder> createState() => _RegisterOrderState();
}

Future<OrderModel> registerOrder(
    String customerid, productid, amount, BuildContext context) async {
  var url = '/api/orders/:id'; //spring boot for adding on orders
  var response = await http.post(url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        "customerid": customerid,
        "productid": productid,
        "amount": amount
      }));
  String responseString = response.body;
  if (response.statusCode == 200) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return MyAlertDialog(title: "Backend Response", content: response.body);
      },
    );
  }
}

class _RegisterOrderState extends State<RegisterOrder> {
  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  OrderModel order;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;

    return Scaffold(
        appBar: AppBar(
          title: Text("Create Order"),
        ),
        body: Form(
            child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
              child: TextFormField(
                style: textStyle,
                controller: firstController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Enter Customerid";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Customerid",
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
                    return "Productid";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Productid",
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
                controller: secondController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Enter amount";
                  }
                },
                decoration: InputDecoration(
                    labelText: "amount",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            RaisedButton(
                child: Text("Submit"),
                onPressed: () async {
                  String customerid = firstController.text;
                  String productid = lastController.text;
                  String amount = secondController.text;
                  OrderModel models = await registerOrder(
                      customerid, productid, amount, context);
                  firstController.text = '';
                  secondController.text = '';
                  lastController.text = '';
                  setState(() {
                    order = models;
                  });
                })
          ]),
        )));
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  MyAlertDialog({this.title, this.content, this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: actions,
      content: Text(
        content,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
