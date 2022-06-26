// ignore_for_file: must_be_immutable, unused_local_variable
//shows all orders in the database in the app

import 'dart:convert';

import 'package:flutter_coffee/models/Order_model.dart';
import 'package:flutter_coffee/screens/orders/delete_orders.dart';
<<<<<<< HEAD
import 'package:flutter_coffee/screens/App_drawer.dart';
=======
import 'package:flutter_coffee/screens/orders/Order_drawer.dart';
>>>>>>> master
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllOrders extends StatefulWidget {
  const GetAllOrders({Key key}) : super(key: key);

  @override
  _GetAllOrdersState createState() => _GetAllOrdersState();
}

class _GetAllOrdersState extends State<GetAllOrders> {
  var orders = List<OrderModel>.generate(200, (index) => null);

  Future<List<OrderModel>> getAllOrders() async {
    var data = await http.get(
        'http://localhost:8080/getAllOrders'); //spring boot for getting all orders
    var jsonData = json.decode(data.body);

    List<OrderModel> order = [];
    for (var e in jsonData) {
      OrderModel orders = new OrderModel();
      orders.id = e["id"];
      orders.customerid = e["customerid"];
      orders.productid = e["productid"];
      orders.amount = e["amount"];
      order.add(orders);
    }
    return order;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Order Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
<<<<<<< HEAD
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AppDrawer()));
=======
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OrderDrawer()));
>>>>>>> master
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getAllOrders(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(child: Icon(Icons.error));
            }
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('ID' +
                        ' ' +
                        'customerid' +
                        ' ' +
                        'productid' +
                        ' ' +
                        'amount'),
                    subtitle: Text('${snapshot.data[index].id}' +
                        ' ' +
                        '${snapshot.data[index].customerid}' +
                        '  ' +
                        '${snapshot.data[index].productid}'
                            '  ' +
                        '${snapshot.data[index].amount}'),
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
  OrderModel orderModel;

  DetailPage(this.orderModel);

  deleteOrder1(OrderModel orderModel) async {
    final url = Uri.parse('http://localhost:8080/deleteOrder');
    final request = http.Request("DELETE", url);
    request.headers
        .addAll(<String, String>{"Content-type": "application/json"});
    request.body = jsonEncode(orderModel);
    final response = await request.send();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(orderModel.customerid.toString()),
        actions: <Widget>[],
      ),
      body: Container(
        child: Text('customerid' +
            ' ' +
            orderModel.customerid.toString() +
            ' ' 'productid' +
            orderModel.productid.toString() +
            ' ' 'productid' +
            orderModel.amount.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          deleteOrder1(orderModel);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DeleteOrder()));
        },
        child: Icon(Icons.delete),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
