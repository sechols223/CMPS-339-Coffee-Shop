// ignore_for_file: missing_return, unused_local_variable, deprecated_member_use
//adds products to the app to the database

import 'dart:convert';

import 'package:flutter_coffee/models/Product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterProduct extends StatefulWidget {
  const RegisterProduct({Key key}) : super(key: key);

  @override
  State<RegisterProduct> createState() => _RegisterProductState();
}

Future<ProductModel> registerProduct(
    String name, size, BuildContext context) async {
  var url = ':8080/api/products';
  var response = await http.post(url,
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{"name": name, "size": size}));
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

class _RegisterProductState extends State<RegisterProduct> {
  final minimumPadding = 5.0;

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;

    return Scaffold(
        appBar: AppBar(
          title: Text("Create Product"),
          backgroundColor: Colors.brown,
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
                    return "Enter Product";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Product Name",
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
                    return "Enter Size";
                  }
                },
                decoration: InputDecoration(
                    labelText: "Size",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            RaisedButton(
                child: Text("Submit"),
                onPressed: () async {
                  String name = firstController.text;
                  String size = lastController.text;
                  ProductModel products =
                      await registerProduct(name, size, context);
                  firstController.text = '';
                  lastController.text = '';
                  setState(() {
                    product = products;
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
