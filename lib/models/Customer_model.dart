// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

CustomerModel CustomerModelJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String CustomerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  int id;
  String firstname;
  String lastname;
  String address;

  CustomerModel({this.id, this.firstname, this.lastname, this.address});

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
      id: json["id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      address: json["address"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "address": address
      };
}
