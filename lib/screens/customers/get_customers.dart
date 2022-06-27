// ignore_for_file: must_be_immutable, unused_local_variable
//shows all customers in the database in the app

import 'dart:convert';
import 'package:flutter_coffee/screens/app_drawer.dart';
import 'package:flutter_coffee/models/Customer_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAllCustomers extends StatefulWidget {
  const GetAllCustomers({Key key}) : super(key: key);

  @override
  _GetAllCustomersState createState() => _GetAllCustomersState();
}

class _GetAllCustomersState extends State<GetAllCustomers> {
  var customers = List<CustomerModel>.generate(200, (index) => null);

  Future<List<CustomerModel>> getAllCustomers() async {
    var data = await http
        .get('/api/customers'); //spring boot for getting all customers
    var jsonData = json.decode(data.body);

    List<CustomerModel> customer = [];
    for (var e in jsonData) {
      CustomerModel customers = new CustomerModel();
      customers.id = e["id"];
      customers.firstname = e["firstname"];
      customers.lastname = e["lastname"];
      customers.address = e["address"];
      customer.add(customers);
    }
    return customer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Customer Details"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AppDrawer()));
          },
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getAllCustomers(),
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
                        'firstname' +
                        ' ' +
                        'lastname' +
                        ' ' +
                        'address'),
                    subtitle: Text('${snapshot.data[index].id}' +
                        ' ' +
                        '${snapshot.data[index].firstname}' +
                        '  ' +
                        '${snapshot.data[index].lastname}'
                            '  ' +
                        '${snapshot.data[index].address}'),
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
  CustomerModel customerModel;

  DetailPage(this.customerModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(customerModel.firstname.toString()),
        actions: <Widget>[],
      ),
      body: Container(
        child: Text('firstname' +
            ' ' +
            customerModel.firstname.toString() +
            ' ' 'lastname' +
            customerModel.lastname.toString() +
            ' ' 'lastname' +
            customerModel.address.toString()),
      ),
    );
  }
}
