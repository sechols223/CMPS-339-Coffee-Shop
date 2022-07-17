// ignore_for_file: file_customerids, non_constant_identifier_customerids

import 'dart:convert';

OrderModel orderModelJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  int id;
  int customerid;
  int productid;
  int amount;
  String price;
  String shippingaddress;
  DateTime date;

  OrderModel(
      {this.id,
      this.customerid,
      this.productid,
      this.amount,
      this.price,
      this.shippingaddress,
      this.date});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      id: json["id"],
      customerid: json["customerid"],
      productid: json["productid"],
      amount: json["amount"],
      price: json["price"],
      shippingaddress: json["shippingaddress"],
      date: json["date"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerid": customerid,
        "productid": productid,
        "amount": amount,
        "price": price,
        "shippingaddress": shippingaddress,
        "date": date,
      };

  // String get customerid => customerid;
  // String get productid =>productid;
}
